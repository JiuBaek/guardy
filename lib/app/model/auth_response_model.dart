import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required bool? success,
    required String? token,
    required String nickname,
    required String phoneNumber,
    required String nationality,
    required int birthYear,
    required String language,
    required String sex,
    String? difficulties,
    required String emContactName,
    required String emContactNumber,
    required String fcmToken,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
