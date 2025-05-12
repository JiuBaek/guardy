import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guardy/app/model/user_model.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(isLoggedIn: false));

  void updateState(AuthState Function(AuthState state) updateFn) {
    state = updateFn(state);
  }
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool isLoggedIn,
    String? accessToken,
    UserModel? user,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
