import 'package:freezed_annotation/freezed_annotation.dart';

part 'risk_item_model.freezed.dart';
part 'risk_item_model.g.dart';

@freezed
class RiskItemModel with _$RiskItemModel {
  factory RiskItemModel({
    required String location,
    required int safetyLevel,
    required List<RiskDetail> detail,
    required String summary,
  }) = _RiskItemModel;

  factory RiskItemModel.fromJson(Map<String, dynamic> json) =>
      _$RiskItemModelFromJson(json);
}

@freezed
class RiskDetail with _$RiskDetail {
  factory RiskDetail({
    required String title,
    required String content,
  }) = _RiskDetail;

  factory RiskDetail.fromJson(Map<String, dynamic> json) =>
      _$RiskDetailFromJson(json);
}
