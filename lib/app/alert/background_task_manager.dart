import 'package:workmanager/workmanager.dart';
import 'package:guardy/app/alert/background_task.dart';

class BackgroundTaskManager {
  static const String _taskName = "uniqueLocationTask";

  static Future<void> initialize() async {
    print('백그라운드 매니저 이니셜라이즈');
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true, // TODO: 개발 중에는 true, 출시할 땐 false로
    );
    print('백그라운드 매니저 콜백 디스패처 불렀다');
  }

  static Future<void> startLocationTracking() async {
    try {
      await Workmanager().cancelAll();
      await Workmanager().registerPeriodicTask(
        _taskName,
        backgroundTaskName,
        frequency: const Duration(minutes: 15),
        initialDelay: const Duration(seconds: 10),
        constraints: Constraints(
          networkType: NetworkType.connected,
        ),
      );
      print('[Main] 🟢 주기적 태스크 등록 완료');
    } catch (e) {
      print('[Main] ❌ 태스크 등록 실패: $e');
    }
  }

  static Future<void> stopLocationTracking() async {
    await Workmanager().cancelByUniqueName(_taskName);
  }
}
