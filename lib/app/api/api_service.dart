import 'package:dio/dio.dart';
import 'package:template/app/api/dio_client.dart';
import 'package:template/app/api/result.dart';
import 'package:template/app/auth/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:template/app/model/home_model.dart';
import 'package:template/app/model/risk_item_model.dart';
import 'package:template/app/model/signup_response_model.dart';
import 'package:template/app/model/login_request_model.dart';
import 'package:template/app/model/signup_request_model.dart';
import 'package:template/app/model/auth_response_model.dart';
import 'package:template/app/model/mode_status_model.dart';

class ApiService {
  static ApiService get I => GetIt.I<ApiService>();

  late final MyDio _dio;

  void setAuthService(AuthService authService) =>
      _dio.setAuthService(authService);

  ApiService() {
    _dio = MyDio(dio: Dio());
  }

  Future<Result<HomeModel>> exampleApi(int id) => _dio.get(
        '/example/$id',
        fromJson: HomeModel.fromJson,
      );
}

//risk

extension ModeStatusApiService on ApiService {
  Future<Result<ModeStatusModel>> getCurrentSafetyStatus() {
    return _dio.get(
      '/safety/status',
      fromJson: ModeStatusModel.fromJson,
    );
  }
}

extension ModeUpdateApiService on ApiService {
  Future<Result<bool>> updateModeStatus({required String mode}) {
    return _dio.post(
      '/safety/mode',
      data: {'mode': mode},
      fromJson: (json) {
        final success = json['success'];
        if (success is bool) {
          return success;
        } else {
          throw Exception('Invalid response: missing success field');
        }
      },
    );
  }
}

extension RiskItemApiService on ApiService {
  Future<Result<RiskItemModel>> dangerInfo({
    required double latitude,
    required double longitude,
  }) {
    return _dio.post(
      '/danger/info',
      data: {
        'latitude': latitude,
        'longitude': longitude,
      },
      fromJson: (json) => RiskItemModel.fromJson(json),
    );
  }
}

//auth

extension AuthApiService on ApiService {
  Future<Result<AuthResponseModel>> login(LoginRequestModel request) {
    return _dio.post(
      '/auth/login',
      data: request.toJson(),
      fromJson: AuthResponseModel.fromJson,
    );
  }

  Future<Result<SignupResponseModel>> signup(SignupRequestModel request) {
    return _dio.post(
      '/auth/signup',
      data: request.toJson(),
      fromJson: SignupResponseModel.fromJson,
    );
  }

  Future<Result<AuthResponseModel>> autoLogin(String accessToken) {
    return _dio.get(
      '/auth/validate',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
      fromJson: AuthResponseModel.fromJson,
    );
  }
}

extension SafetyApiService on ApiService {
  Future<Result<void>> safetyCheckin() {
    return _dio.post(
      '/safety/checkin',
      fromJson: (_) {},
    );
  }

  // Future<Result<void>> triggerFinalEmergencyAlert() {
  //   return _dio.post(
  //     '/safety/emergency', // 예시용, 실제 서버 URI 확인 필요
  //     fromJson: (_) {},
  //   );
  //}
}

//settings patch

extension UserProfileApiService on ApiService {
  Future<Result<void>> updateProfile({
    required String nickname,
    required String password,
    required String phoneNumber,
    required String nationality,
    required int birthYear,
    required String language,
    required String sex,
    String? difficulties,
    required String emContactName,
    required String emContactNumber,
  }) {
    return _dio.patch(
      '/user/profile',
      data: {
        'nickname': nickname,
        'password': password,
        'phoneNumber': phoneNumber,
        'nationality': nationality,
        'birthYear': birthYear,
        'language': language,
        'sex': sex,
        'difficulties': difficulties,
        'emContactName': emContactName,
        'emContactNumber': emContactNumber,
      },
      fromJson: (_) {},
    );
  }
}

// location
extension LocationApiService on ApiService {
  Future<Result<void>> sendCurrentLocation({
    required double latitude,
    required double longitude,
    required DateTime lastUpdatedAt,
  }) {
    return _dio.post(
      '/safety/location',
      data: {
        'latitude': latitude,
        'longitude': longitude,
        'lastUpdatedAt': lastUpdatedAt.toIso8601String(),
      },
      fromJson: (_) {},
    );
  }

  Future<Result<String>> getLocationName({
    required double latitude,
    required double longitude,
  }) {
    return _dio.post(
      '/danger/location',
      data: {
        'latitude': latitude,
        'longitude': longitude,
      },
      fromJson: (json) => json['location'] as String,
    );
  }
}
