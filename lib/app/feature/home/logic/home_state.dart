import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guardy/app/model/home_model.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool isActive,
    @Default(false) bool safetyChecked,
    @Default(false) bool isLoading,
    @Default('Unknown Place, Please wait a second') String location,
    String? safetyLevel,
    String? safetyDescription,
    @Default([]) List<HomeModel> risks,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
