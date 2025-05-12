// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupRequestModelImpl _$$SignupRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupRequestModelImpl(
      nickname: json['nickname'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationality: json['nationality'] as String,
      birthYear: (json['birthYear'] as num).toInt(),
      language: json['language'] as String,
      sex: json['sex'] as String,
      difficulties: json['difficulties'] as String?,
      emContactName: json['emContactName'] as String,
      emContactNumber: json['emContactNumber'] as String,
      fcmToken: json['fcmToken'] as String,
    );

Map<String, dynamic> _$$SignupRequestModelImplToJson(
        _$SignupRequestModelImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'nationality': instance.nationality,
      'birthYear': instance.birthYear,
      'language': instance.language,
      'sex': instance.sex,
      'difficulties': instance.difficulties,
      'emContactName': instance.emContactName,
      'emContactNumber': instance.emContactNumber,
      'fcmToken': instance.fcmToken,
    };
