import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response_model.freezed.dart';
part 'signup_response_model.g.dart';

@freezed
class SignupResponseModel with _$SignupResponseModel {
  factory SignupResponseModel({
    required bool success,
  }) = _SignupResponseModel;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);
}
