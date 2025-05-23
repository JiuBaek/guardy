import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static String? lastPayload;
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get plugin => _plugin;

  static Future<void> requestNotificationPermission() async {
    final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    if (androidPlugin != null) {
      await androidPlugin.createNotificationChannel(
        const AndroidNotificationChannel(
          'fcm_local_channel',
          'FCM with Button',
          description: 'FCM remanagement message',
          importance: Importance.max,
        ),
      );
      await androidPlugin.createNotificationChannel(
        const AndroidNotificationChannel(
          'danger_check_channel',
          'Danger Check',
          description: 'Notifications about detected dangers',
          importance: Importance.max,
        ),
      );
    }

    if (androidPlugin != null) {
      await Permission.notification.request();
    }
  }

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationClick,
    );
  }

  static void _handleNotificationClick(NotificationResponse response) {
    if (response.actionId == 'CONFIRM_SAFE') {
      _handleUserConfirmedSafety();
    }
  }

  static Future<void> _handleUserConfirmedSafety() async {
    await ApiService.I.safetyCheckin();
  }

  //safe notification
  static Future<void> showFirebaseNotification(
      String? title, String? body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'fcm_local_channel',
      'FCM with Button',
      channelDescription: 'FCM remanagement message',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('CONFIRM_SAFE', 'I\'m Safe',
            showsUserInterface: true),
      ],
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await _plugin.show(
      101,
      title ?? 'notification',
      body ?? "If you are safe now, please tell us I'm Safe.",
      platformDetails,
      payload: 'safety',
    );
  }

  //local
  static Future<void> showDangerNotification({
    required String location,
    required int safetyLevel,
    required String summary,
  }) async {
    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'danger_check_channel',
      'Danger Check',
      channelDescription: 'Notifications about detected dangers',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true,
      styleInformation: BigTextStyleInformation(summary),
    );

    final NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _plugin.show(
      1,
      'Current Safety Level: $safetyLevel (${_dangerLevelToText(safetyLevel)})',
      summary,
      platformDetails,
      payload: 'danger',
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
