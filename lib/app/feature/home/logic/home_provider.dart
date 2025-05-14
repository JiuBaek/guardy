import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:guardy/app/feature/home/logic/home_state.dart';
import 'package:guardy/app/model/home_model.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:guardy/app/alert/location/location_service.dart';

final homeProvider = NotifierProvider<HomeProvider, HomeState>(
  HomeProvider.new,
);

class HomeProvider extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState();
  }

  Future<void> requestNotificationPermission() async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(alert: true, badge: true, sound: true);
  }

  Future<void> fetchMode() async {
    final result = await ApiService.I.getCurrentSafetyStatus();

    result.fold(
      onSuccess: (data) {
        final isSafe = (data.mode == 'safe');
        state = state.copyWith(isActive: isSafe);
        refreshLocationOnly();
      },
      onFailure: (error) {
        state = state.copyWith(isActive: false);
      },
    );
  }

  Future<void> toggleActive() async {
    final newActiveState = !state.isActive;
    final previousState = state;

    state = state.copyWith(isActive: newActiveState);

    final mode = newActiveState ? 'safe' : 'sleeping';
    final result = await ApiService.I.updateModeStatus(mode: mode);

    result.fold(
      onSuccess: (_) {
        if (newActiveState) {
          refreshLocationOnly();
        }
      },
      onFailure: (error) {
        state = previousState;
      },
    );
  }

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  Future<void> performSafetyCheck() async {
    try {
      setLoading(true);
      final position = await LocationService.I.getCurrentLocation();
      final result = await ApiService.I.dangerInfo(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      result.fold(
        onSuccess: (data) {
          state = state.copyWith(
            safetyChecked: true,
            location: data.location,
            safetyLevel: 'Safety Level ${data.safetyLevel}',
            safetyDescription: data.summary,
            risks: data.detail
                .map((e) => HomeModel(
                      id: e.title.hashCode,
                      title: e.title,
                      description: e.content,
                      level: data.safetyLevel,
                    ))
                .toList(),
          );
        },
        onFailure: (e) {
          //print('[SafetyCheck 실패] ${e.message}');
        },
      );
    } catch (e) {
      //print('[위치 측정 실패] $e');
    }
    setLoading(false);
  }

  Future<void> refreshLocationOnly() async {
    try {
      final position = await LocationService.I.getCurrentLocation();

      final result = await ApiService.I.getLocationName(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      result.fold(
        onSuccess: (loc) => state = state.copyWith(location: loc),
        onFailure: (_) => state = state.copyWith(location: 'Unknown'),
      );
    } catch (_) {
      state = state.copyWith(location: 'Location error');
    }
  }
}
