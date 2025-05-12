import 'package:dio/dio.dart';
import 'package:template/app/auth/auth_service.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final AuthService authService;
  final Dio dio;

  AuthInterceptor({required this.authService, required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = authService.state.accessToken;
    final isLoggedIn = authService.state.isLoggedIn;

    if (isLoggedIn && token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return super.onError(err, handler);
    }

    try {
      err.requestOptions.headers["Authorization"] =
          "Bearer ${authService.state.accessToken}";

      final res = await dio.fetch(err.requestOptions);

      return handler.resolve(res);
    } catch (error) {
      if (error is DioException) {
        handler.reject(error);
      }
    }
  }
}
