import 'package:workmanager/workmanager.dart';
import 'package:guardy/app/alert/background_task.dart';

class BackgroundTaskManager {
  static const String _taskName = "uniqueLocationTask";

  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );
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
    } catch (e) {
      //
    }
  }

  static Future<void> stopLocationTracking() async {
    await Workmanager().cancelByUniqueName(_taskName);
  }
}
