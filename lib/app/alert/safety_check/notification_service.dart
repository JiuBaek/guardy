import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/model/risk_item_model.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _onNotificationClick();
      },
    );
  }

  static void _onNotificationClick() {
    RouterService.I.router.go(Routes.splash);
  }

  //firebase
  static Future<void> showFirebaseNotification(
      String? title, String? body) async {
    await _plugin.show(
      101,
      title ?? '알림',
      body ?? '',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'fcm_default_channel',
          'FCM Noti',
          channelDescription: 'Firebase Cloud Messages',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  //local
  static Future<void> showDangerNotification({
    required String location,
    required int safetyLevel,
    required List<RiskDetail> details,
    required String summary,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'danger_check_channel',
      'Danger Check',
      channelDescription: 'Notifications about detected dangers',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(''),
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _plugin.show(
      1,
      'Current Safety Level: $safetyLevel (${_dangerLevelToText(safetyLevel)})',
      summary,
      platformDetails,
    );
  }

  static String _dangerLevelToText(int level) {
    switch (level) {
      case 1:
        return "Very Safe";
      case 2:
        return "Safe";
      case 3:
        return "Caution";
      case 4:
        return "Dangerous";
      case 5:
        return "Very Dangerous";
      default:
        return "Unknown";
    }
  }
}
