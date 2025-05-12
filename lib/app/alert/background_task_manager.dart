import 'package:workmanager/workmanager.dart';
import 'package:template/app/alert/background_task.dart';

class BackgroundTaskManager {
  static const String _taskName = "uniqueLocationTask";

  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true, // TODO: 개발 중에는 true, 출시할 땐 false로
    );
  }

  // 위치 추적 시작 (로그인 성공 직후)
  static Future<void> startLocationTracking() async {
    await Workmanager().registerPeriodicTask(
      _taskName,
      backgroundTaskName,
      frequency: const Duration(minutes: 15),
      initialDelay: const Duration(seconds: 10),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  /// 위치 추적 중단 (로그아웃 등에서)
  static Future<void> stopLocationTracking() async {
    await Workmanager().cancelByUniqueName(_taskName);
  }
}
