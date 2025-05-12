import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/app/model/user_model.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    required bool isLoading,
    UserModel? user,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);
}
