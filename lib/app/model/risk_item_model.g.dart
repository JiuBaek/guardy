// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risk_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RiskItemModelImpl _$$RiskItemModelImplFromJson(Map<String, dynamic> json) =>
    _$RiskItemModelImpl(
      location: json['location'] as String,
      safetyLevel: (json['safetyLevel'] as num).toInt(),
      detail: (json['detail'] as List<dynamic>)
          .map((e) => RiskDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String,
    );

Map<String, dynamic> _$$RiskItemModelImplToJson(_$RiskItemModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'safetyLevel': instance.safetyLevel,
      'detail': instance.detail,
      'summary': instance.summary,
    };

_$RiskDetailImpl _$$RiskDetailImplFromJson(Map<String, dynamic> json) =>
    _$RiskDetailImpl(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$RiskDetailImplToJson(_$RiskDetailImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };
