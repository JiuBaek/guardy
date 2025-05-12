// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      success: json['success'] as bool?,
      token: json['token'] as String?,
      nickname: json['nickname'] as String,
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

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'nickname': instance.nickname,
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
