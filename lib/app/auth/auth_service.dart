import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:guardy/app/api/api_service.dart';
import 'package:guardy/app/auth/auth_state.dart';
import 'package:guardy/app/model/login_request_model.dart';
import 'package:guardy/app/service/secure_storage_service.dart';
import 'package:guardy/app/api/result.dart';
import 'package:guardy/app/model/signup_request_model.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/model/user_model.dart';

class AuthService {
  static AuthService get I => GetIt.I<AuthService>();

  late final ProviderContainer container;
  final ApiService _api;
  final SecureStorageService secureStorageService;

  AuthState get state => container.read(authStateProvider);

  AuthService({
    required ApiService api,
    required this.secureStorageService,
    required this.container,
  }) : _api = api {
    _api.setAuthService(this);
  }
}

extension AuthServiceExtension on AuthService {
  Future<Result<void>> login(String nickname, String password) async {
    final result = await _api
        .login(LoginRequestModel(nickname: nickname, password: password));

    return await result.fold(onSuccess: (loginResponse) async {
      await secureStorageService.saveTokens(loginResponse.token!);

      final notifier = container.read(authStateProvider.notifier);
      notifier.updateState((state) => state.copyWith(
            isLoggedIn: true,
            accessToken: loginResponse.token,
            user: UserModel(
              nickname: loginResponse.nickname,
              phoneNumber: loginResponse.phoneNumber,
              nationality: loginResponse.nationality,
              birthYear: loginResponse.birthYear,
              language: loginResponse.language,
              sex: loginResponse.sex,
              difficulties: loginResponse.difficulties,
              emContactName: loginResponse.emContactName,
              emContactNumber: loginResponse.emContactNumber,
            ),
          ));
      await secureStorageService.saveTokens(loginResponse.token!);

      return Result.success(null);
    }, onFailure: (error) {
      return Result.failure(error);
    });
  }

  Future<bool> tryAutoLogin() async {
    final accessToken = await secureStorageService.accessToken;

    if (accessToken != null) {
      final result = await _api.autoLogin(accessToken);

      return result.fold(
        onSuccess: (authResponse) async {
          final notifier = container.read(authStateProvider.notifier);
          notifier.updateState((state) => state.copyWith(
                isLoggedIn: true,
                accessToken: accessToken,
                user: UserModel(
                  nickname: authResponse.nickname,
                  phoneNumber: authResponse.phoneNumber,
                  nationality: authResponse.nationality,
                  birthYear: authResponse.birthYear,
                  language: authResponse.language,
                  sex: authResponse.sex,
                  difficulties: authResponse.difficulties,
                  emContactName: authResponse.emContactName,
                  emContactNumber: authResponse.emContactNumber,
                ),
              ));
          //print('자동 로그인 성공');
          return true;
        },
        onFailure: (error) async {
          //print('자동 로그인 실패');
          await secureStorageService.clearTokens();
          return false;
        },
      );
    }
    return false;
  }

  Future<Result<bool>> signUp(SignupRequestModel request) async {
    final result = await _api.signup(request);

    return result.fold(
      onSuccess: (signupResponse) async {
        if (signupResponse.success) {
          RouterService.I.router.go(Routes.login);
          return Result.success(true);
        } else {
          return Result.success(false);
        }
      },
      onFailure: (error) => Result.failure(error),
    );
  }

  Future<void> logout() async {
    await secureStorageService.deleteAll();

    final notifier = container.read(authStateProvider.notifier);
    notifier.updateState((state) => state.copyWith(
          isLoggedIn: false,
          accessToken: null,
          user: null,
        ));
  }
}
