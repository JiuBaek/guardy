import 'package:workmanager/workmanager.dart';
import 'package:guardy/app/alert/background_task.dart';

class BackgroundTaskManager {
  static const String _taskName = "uniqueLocationTask";

  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false, // TODO: 개발 중에는 true, 출시할 땐 false로
    );
  }

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

  static Future<void> stopLocationTracking() async {
    await Workmanager().cancelByUniqueName(_taskName);
  }
}
