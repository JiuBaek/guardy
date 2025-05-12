import 'package:freezed_annotation/freezed_annotation.dart';

part 'mode_status_model.freezed.dart';
part 'mode_status_model.g.dart';

@freezed
class ModeStatusModel with _$ModeStatusModel {
  factory ModeStatusModel({
    required String mode,
    int? safetyStage,
    String? lastCheckinTime,
  }) = _ModeStatusModel;

  factory ModeStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ModeStatusModelFromJson(json);
}
