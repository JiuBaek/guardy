// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      isActive: json['isActive'] as bool? ?? false,
      safetyChecked: json['safetyChecked'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
      location:
          json['location'] as String? ?? 'Unknown Place, Please wait a second',
      safetyLevel: json['safetyLevel'] as String?,
      safetyDescription: json['safetyDescription'] as String?,
      risks: (json['risks'] as List<dynamic>?)
              ?.map((e) => HomeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'isActive': instance.isActive,
      'safetyChecked': instance.safetyChecked,
      'isLoading': instance.isLoading,
      'location': instance.location,
      'safetyLevel': instance.safetyLevel,
      'safetyDescription': instance.safetyDescription,
      'risks': instance.risks,
    };
