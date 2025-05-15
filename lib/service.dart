part of 'main.dart';

class Service {
  static bool _fcmHandlersInitialized = false;

  static Future<void> initFlutter() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    debugPrint('initFlutter');
  }

  static Future<void> initEnv() async {
    const envFileName =
        String.fromEnvironment('ENV_FILE_NAME', defaultValue: '.env');

    await dotenv.load(fileName: envFileName);
  }

  static ProviderContainer registerServices() {
    final container = ProviderContainer();

    final apiService = GetIt.I.registerSingleton(ApiService());

    final secureStorageSerivce = GetIt.I.registerSingleton(
      SecureStorageService()..init(),
    );
    //auth
    GetIt.I.registerSingleton(AuthService(
      api: apiService,
      secureStorageService: secureStorageSerivce,
      container: container,
    ));

    ApiService.I.setAuthService(AuthService.I);

    // routing
    GetIt.I.registerSingleton(RouterService()..init());
    return container;
  }

  static void setupFirebaseMessagingHandlers() {
    if (_fcmHandlersInitialized) return;
    _fcmHandlersInitialized = true;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? message.data['title'];
      final body = message.notification?.body ?? message.data['body'];
      if (title != null && body != null) {
        NotificationService.showFirebaseNotification(title, body);
      }
    });
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
