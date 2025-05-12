import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/feature/settings/logic/settings_state.dart';
import 'package:template/app/model/user_model.dart';

final settingsProvider = NotifierProvider<SettingsProvider, SettingsState>(
  SettingsProvider.new,
);

class SettingsProvider extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    return SettingsState(isLoading: false, user: null);
  }

  Future<void> fetchUserInfo() async {
    state = state.copyWith(isLoading: true);

    try {
      // 여기서 서버 통신
      final userJson = {
        "id": "1",
        "nickname": "지우",
        "email": "jiu@example.com",
        "profileImageUrl": "https://example.com/profile.png",
      };

      final user = UserModel.fromJson(userJson);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
