import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardy/app/alert/safety_check/safety_check_state.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';
//import 'package:template/app/api/api_service.dart';

class SafetyCheckService {
  static SafetyCheckService? _instance;
  static SafetyCheckService get I => _instance!;

  static Future<void> init(ProviderContainer container) async {
    _instance = SafetyCheckService._(container);
    await _instance!._loadState();
  }

  final ProviderContainer container;
  Timer? _timer;

  SafetyCheckService._(this.container);

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final isActive = prefs.getBool('safety_check_active') ?? false;
    final startedAtMillis = prefs.getInt('safety_check_startedAt');

    if (isActive && startedAtMillis != null) {
      final startedAt = DateTime.fromMillisecondsSinceEpoch(startedAtMillis);
      container.read(safetyCheckProvider.notifier).loadFrom(startedAt);
      _startTimer();
    }
  }

  Future<void> activate() async {
    final notifier = container.read(safetyCheckProvider.notifier);
    notifier.activate();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('safety_check_active', true);
    await prefs.setInt(
        'safety_check_startedAt', DateTime.now().millisecondsSinceEpoch);

    _startTimer();
  }

  Future<void> deactivate() async {
    final notifier = container.read(safetyCheckProvider.notifier);
    notifier.deactivate();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('safety_check_active', false);
    await prefs.remove('safety_check_startedAt');

    _timer?.cancel();

    await NotificationService.cancelSafetyCheckNotification();
  }

  void confirmUserSafe() {
    container.read(safetyCheckProvider.notifier).resetAlert();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 10), (_) {
      _checkAndNotify();
    });
  }

  void _checkAndNotify() async {
    final state = container.read(safetyCheckProvider);
    if (!state.isActive || state.startedAt == null) return;

    final now = DateTime.now();
    final diff = now.difference(state.startedAt!);
    final step = state.alertStep;

    if (step == 0 && diff.inHours >= 6) {
      NotificationService.showSafetyCheckNotification(); // 1단계
      container.read(safetyCheckProvider.notifier).incrementAlertStep();
    } else if (step == 1 && diff.inMinutes >= 6 * 60 + 60) {
      NotificationService.showSecondWarningNotification(); // 2단계
      container.read(safetyCheckProvider.notifier).incrementAlertStep();
    } else if (step == 2 && diff.inMinutes >= 6 * 60 + 90) {
      NotificationService.showThirdWarningNotification(); // 3단계
      container.read(safetyCheckProvider.notifier).incrementAlertStep();
    } else if (step == 3 && diff.inMinutes >= 6 * 60 + 105) {
      //await ApiService.I.triggerFinalEmergencyAlert(); // 최종 경고
      container.read(safetyCheckProvider.notifier).incrementAlertStep();
    }
  }
}
