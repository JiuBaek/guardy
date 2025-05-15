import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/settings/logic/settings_state.dart';

final settingsProvider = NotifierProvider<SettingsProvider, SettingsState>(
  SettingsProvider.new,
);

class SettingsProvider extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    return SettingsState(isLoading: false, user: null);
  }
}
