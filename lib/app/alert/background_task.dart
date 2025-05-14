import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String backgroundTaskName = "locationBackgroundTask";

double? lastLatitude;
double? lastLongitude;
const double distanceThresholdInMeters = 1000.0; // 1km

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          return Future.value(false);
        }
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final currentLatitude = position.latitude;
      final currentLongitude = position.longitude;

      //current location for emergency SMS
      await ApiService.I.sendCurrentLocation(
        latitude: currentLatitude,
        longitude: currentLongitude,
        lastUpdatedAt: DateTime.now(),
      );

      final prefs = await SharedPreferences.getInstance();
      final lastLat = prefs.getDouble('lastLatitude');
      final lastLon = prefs.getDouble('lastLongitude');

      if (lastLatitude != null && lastLongitude != null) {
        final distance = Geolocator.distanceBetween(
          lastLat!,
          lastLon!,
          currentLatitude,
          currentLongitude,
        );

        if (distance < distanceThresholdInMeters) {
          debugPrint('[BackgroundTask] 이동 거리 $distance m -> 기준치 이하여서 서버 요청 안함');
          return Future.value(true);
        }
      }

      final result = await ApiService.I.dangerInfo(
        latitude: currentLatitude,
        longitude: currentLongitude,
      );

      await prefs.setDouble('lastLatitude', currentLatitude);
      await prefs.setDouble('lastLongitude', currentLongitude);

      result.fold(
        onSuccess: (riskItem) async {
          await NotificationService.showDangerNotification(
              location: riskItem.location,
              safetyLevel: riskItem.safetyLevel,
              details: riskItem.detail,
              summary: riskItem.summary);
        },
        onFailure: (error) {
          debugPrint('[BackgroundTask] 위험정보 가져오기 실패: ${error.message}');
        },
      );

      return Future.value(true);
    } catch (e) {
      debugPrint('[BackgroundTask] 에러 발생: $e');
      return Future.value(false);
    }
  });
}
