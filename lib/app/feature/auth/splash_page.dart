import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guardy/app/auth/auth_service.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/alert/safety_check/notification_service.dart';
import 'package:guardy/app/feature/home/logic/home_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));
    final bool success = await AuthService.I.tryAutoLogin();

    await _handleDangerNotificationLaunch();

    if (success) {
      RouterService.I.router.go(Routes.home);
    } else {
      RouterService.I.router.go(Routes.firstuser);
    }
  }

  Future<bool> _handleDangerNotificationLaunch() async {
    final launchDetails =
        await NotificationService.plugin.getNotificationAppLaunchDetails();

    final isDangerNotiLaunch =
        launchDetails?.didNotificationLaunchApp == true &&
            launchDetails?.notificationResponse?.payload == 'danger';

    if (!isDangerNotiLaunch) return false;

    final prefs = await SharedPreferences.getInstance();

    ref.read(homeProvider.notifier).updateRiskInfoFromPrefs(prefs);
    RouterService.I.router.go(Routes.riskItem);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
