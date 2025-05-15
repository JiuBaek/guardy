import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:guardy/app/auth/auth_service.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/service/secure_storage_service.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';
import 'package:guardy/app/alert/background_task_manager.dart';

part 'service.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      await Service.initFlutter();

      await Service.initEnv();

      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: dotenv.env['FIREBASE_API_KEY']!,
          appId: dotenv.env['FIREBASE_APP_ID']!,
          messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
          projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        ),
      );

      await NotificationService.init();

      final serviceProviderContainer = Service.registerServices();

      Service.setupFirebaseMessagingHandlers();

      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      await NotificationService.requestNotificationPermission();

      await BackgroundTaskManager.initialize();
      await BackgroundTaskManager.startLocationTracking();

      final router = RouterService.I.router;

      runApp(UncontrolledProviderScope(
        container: serviceProviderContainer,
        child: MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(builder: (context) => child!),
              ],
            );
          },
        ),
      ));
    },
    (error, stackTrace) {
      log('runZonedGuarded: ', error: error, stackTrace: stackTrace);
      debugPrint('runZonedGuarded: $error');
    },
  );
}
