import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:guardy/app/feature/auth/login_page.dart';
import 'package:guardy/app/feature/auth/signup_page1.dart';
import 'package:guardy/app/feature/auth/signup_page2.dart';
import 'package:guardy/app/feature/auth/signup_page3.dart';
import 'package:guardy/app/feature/auth/firstuser_page.dart';
import 'package:guardy/app/feature/auth/splash_page.dart';
import 'package:guardy/app/feature/error/error_page.dart';
import 'package:guardy/app/feature/home/home_page.dart';
import 'package:guardy/app/feature/settings/settings_page.dart';
import 'package:guardy/app/feature/settings/settings_account_info.dart';
import 'package:guardy/app/feature/settings/settings_emergency.dart';
import 'package:guardy/app/feature/settings/settings_personal.dart';
import 'package:guardy/app/feature/risk_item/risk_item_page.dart';

extension GoRouterX on GoRouter {
  BuildContext? get context => configuration.navigatorKey.currentContext;
  OverlayState? get overlayState {
    final context = this.context;
    if (context == null) return null;
    return Overlay.of(context);
  }

  Uri get currentUri {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri;
  }
}

abstract class Routes {
  static const String home = '/';
  static const String settings = '/settings';
  static const String settingsAccountInfo = '/settings/account_info';
  static const String settingsPersonal = '/settings/personal';
  static const String settingsEmergency = '/settings/emergency';
  static const String error = '/error';
  static const String riskItem = '/risk_item';
  static const String login = '/auth/login';
  static const String signup = '/auth/signup1';
  static const String signup2 = '/auth/signup2';
  static const String signup3 = '/auth/signup3';
  static const String firstuser = '/auth/firstuser';
  static const String splash = '/auth/splash';
}

class RouterService {
  static RouterService get I => GetIt.I<RouterService>();

  late final GoRouter router;

  String? queryParameter(String key) => router.currentUri.queryParameters[key];

  void init() {
    router = GoRouter(
      initialLocation: Routes.splash,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: Routes.settings,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: Routes.settingsAccountInfo,
          builder: (context, state) => const SettingsAccountInfo(),
        ),
        GoRoute(
          path: Routes.settingsPersonal,
          builder: (context, state) => const SettingsPersonal(),
        ),
        GoRoute(
          path: Routes.settingsEmergency,
          builder: (context, state) => const SettingsEmergencyContacts(),
        ),
        GoRoute(
            path: Routes.riskItem,
            builder: (context, state) => const RiskItemPage()),
        GoRoute(
            path: Routes.login, builder: (context, state) => const LoginPage()),
        GoRoute(
            path: Routes.signup,
            builder: (context, state) => const SignUpPage1()),
        GoRoute(
          path: Routes.signup2,
          builder: (context, state) => SignUpPage2(state: state),
        ),
        GoRoute(
          path: Routes.signup3,
          builder: (context, state) => SignUpPage3(state: state),
        ),
        GoRoute(
            path: Routes.firstuser,
            builder: (context, state) => const FirstUserPage()),
        GoRoute(
            path: Routes.splash,
            builder: (context, state) => const SplashPage()),
      ], //Todo: Add routes

      errorBuilder: (context, state) {
        return const ErrorPage();
      },
    );
  }
}
