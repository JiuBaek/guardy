part of 'main.dart';

class Service {
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
    //인증 관련
    GetIt.I.registerSingleton(AuthService(
      api: apiService,
      secureStorageService: secureStorageSerivce,
      container: container,
    ));

    ApiService.I.setAuthService(AuthService.I);

    // 앱 라우팅(페이지 이동) 담당
    GetIt.I.registerSingleton(RouterService()..init());
    return container;
  }
}
/* main() 시작

runZonedGuarded 안에서 실행 (오류 감지용)

Service.initFlutter() → Flutter 준비 + 화면 세로 고정

Service.initEnv() → .env 파일 로드

registerServices() → 모든 서비스 등록

RouterService.I.router 가져오기

runApp() → 앱 실행

앱은 MaterialApp.router(...)를 사용해 화면을 렌더링하고, 등록된 라우터 및 상태를 통해 작동

*/
