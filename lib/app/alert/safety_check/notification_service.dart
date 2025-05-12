import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:template/app/routing/router_service.dart';
import 'package:template/app/alert/safety_check/safety_check_service.dart';
import 'package:template/app/api/api_service.dart';
import 'package:template/app/model/risk_item_model.dart';

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
        if (response.actionId == 'SAFE_ACTION') {
          _handleSafeAction();
        } else {
          _onNotificationClick();
        }
      },
    );
  }

  static void _onNotificationClick() {
    RouterService.I.router.go(Routes.riskItem);
  }

  static void _handleSafeAction() async {
    try {
      SafetyCheckService.I.confirmUserSafe();

      await ApiService.I.safetyCheckin();

      await cancelSafetyCheckNotification();
    } catch (e) {
      //debugPrint('응답 처리 실패: $e');
    }
  }

  static Future<void> showSafetyCheckNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'safety_check_channel',
      'Safety Check',
      channelDescription: 'Notifications to remind users to check their safety',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      styleInformation:
          BigTextStyleInformation('Please check your safety status.'),
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'SAFE_ACTION', // ID
          'I\'m Safe', // Label
        ),
      ],
    );

    //1st alert
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _plugin.show(
      0,
      'Hi, Username!',
      'Please check your safety status.',
      platformChannelSpecifics,
    );
  }

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

  static Future<void> cancelSafetyCheckNotification() async {
    await _plugin.cancel(0);
    // '0'은 우리가 Safety Check 알림 보낼 때 사용한 notification ID
  }

  //2nd alert
  static Future<void> showSecondWarningNotification() async {
    await _plugin.show(
      1,
      'We still need your response',
      'Please confirm you are safe.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'safety_check_channel',
          'Safety Check',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  //3rd alert
  static Future<void> showThirdWarningNotification() async {
    await _plugin.show(
      2,
      'This is your final reminder',
      'Please respond now or we will contact your emergency contact.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'safety_check_channel',
          'Safety Check',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}
