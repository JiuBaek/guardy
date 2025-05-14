import 'dart:async';
import 'dart:developer';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:guardy/app/auth/auth_service.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/service/secure_storage_service.dart';
import 'package:guardy/app/alert/background_task.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';

part 'service.dart';

void main() async {
  //오류 감지
  runZonedGuarded<Future<void>>(
    () async {
      await Service.initFlutter();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await NotificationService.init();

      await Service.initEnv();

      debugPrint('2.5 - Flutter initialized');

      final serviceProviderContainer = Service.registerServices();
      debugPrint('3 - Services registered');

      await NotificationService.init();

      Service.setupFirebaseMessagingHandlers();
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      await NotificationService.requestNotificationPermission();

      debugPrint('4 - Services initialized');
      await Workmanager().initialize(
        callbackDispatcher,
        isInDebugMode: true,
      );
      debugPrint('5 - Workmanager initialized');

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
