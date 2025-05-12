import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_model.freezed.dart';
part 'signup_request_model.g.dart';

@freezed
class SignupRequestModel with _$SignupRequestModel {
  const factory SignupRequestModel({
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
    required String fcmToken,
  }) = _SignupRequestModel;

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);
}
