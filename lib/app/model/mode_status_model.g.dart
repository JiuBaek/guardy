// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModeStatusModelImpl _$$ModeStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ModeStatusModelImpl(
      mode: json['mode'] as String,
      safetyStage: (json['safetyStage'] as num?)?.toInt(),
      lastCheckinTime: json['lastCheckinTime'] as String?,
    );

Map<String, dynamic> _$$ModeStatusModelImplToJson(
        _$ModeStatusModelImpl instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'safetyStage': instance.safetyStage,
      'lastCheckinTime': instance.lastCheckinTime,
    };
