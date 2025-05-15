import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:workmanager/workmanager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guardy/app/api/result.dart';
import 'package:guardy/app/api/api_error.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardy/app/model/risk_item_model.dart';

const String backgroundTaskName = "locationBackgroundTask";

double? lastLatitude;
double? lastLongitude;
const double distanceThresholdInMeters = 10.0; //TODO: 1000.0으으로 고치기

void callbackDispatcher() {
  print('나 실행됨');
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
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

      await sendCurrentLocationBackground(
          latitude: currentLatitude, longitude: currentLongitude);

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

        // if (distance < distanceThresholdInMeters) {
        //   return Future.value(true);
        // }
        debugPrint('[BG] 거리 $distance m → 위험 요청 진행');
      }

      final result = await getCurrentRiskInfo(
          latitude: currentLatitude, longitude: currentLongitude);

      await prefs.setDouble('lastLatitude', currentLatitude);
      await prefs.setDouble('lastLongitude', currentLongitude);

      result.fold(
        onSuccess: (riskItem) async {
          await NotificationService.showDangerNotification(
              location: riskItem.location,
              safetyLevel: riskItem.safetyLevel,
              summary: riskItem.summary);

          final riskListJson =
              jsonEncode(riskItem.detail.map((e) => e.toJson()).toList());

          await prefs.setString('risk_location', riskItem.location);
          await prefs.setInt('risk_level', riskItem.safetyLevel);
          await prefs.setString('risk_risks', riskListJson);
          await prefs.setString('risk_summary', riskItem.summary);
        },
        onFailure: (error) {
          debugPrint('[BackgroundTask] failed');
        },
      );

      return Future.value(true);
    } catch (e) {
      debugPrint('[BackgroundTask] error: $e');
      return Future.value(false);
    }
  });
}

Future<void> sendCurrentLocationBackground({
  required double latitude,
  required double longitude,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final jwtToken = prefs.getString('access_token');

  final dio = Dio();
  const baseUrl =
      'https://guardy-server-06-370063711668.asia-northeast3.run.app';
  dio.options.headers['Authorization'] = 'Bearer $jwtToken';

  await dio.post(
    '$baseUrl/safety/location/',
    data: {
      'latitude': latitude,
      'longitude': longitude,
      'lastUpdatedAt': DateTime.now().toIso8601String(),
    },
  );
}

Future<Result<RiskItemModel>> getCurrentRiskInfo({
  required double latitude,
  required double longitude,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final jwtToken = prefs.getString('access_token');

  final dio = Dio();
  const baseUrl =
      'https://guardy-server-06-370063711668.asia-northeast3.run.app';
  dio.options.headers['Authorization'] = 'Bearer $jwtToken';

  try {
    final response = await dio.post(
      '$baseUrl/danger/info',
      data: {
        'latitude': latitude,
        'longitude': longitude,
      },
    );

    return Result.success(RiskItemModel.fromJson(response.data));
  } catch (e) {
    return Result.failure(ApiError.unknown(e));
  }
}
