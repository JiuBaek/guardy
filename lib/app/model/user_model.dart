import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String nickname,
    required String phoneNumber,
    required String nationality,
    required int birthYear,
    required String language,
    required String sex,
    String? difficulties,
    required String emContactName,
    required String emContactNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
