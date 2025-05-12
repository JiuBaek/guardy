// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      nickname: json['nickname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationality: json['nationality'] as String,
      birthYear: (json['birthYear'] as num).toInt(),
      language: json['language'] as String,
      sex: json['sex'] as String,
      difficulties: json['difficulties'] as String?,
      emContactName: json['emContactName'] as String,
      emContactNumber: json['emContactNumber'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'phoneNumber': instance.phoneNumber,
      'nationality': instance.nationality,
      'birthYear': instance.birthYear,
      'language': instance.language,
      'sex': instance.sex,
      'difficulties': instance.difficulties,
      'emContactName': instance.emContactName,
      'emContactNumber': instance.emContactNumber,
    };
