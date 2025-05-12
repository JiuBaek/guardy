import 'package:flutter_riverpod/flutter_riverpod.dart';

final safetyCheckProvider =
    StateNotifierProvider<SafetyCheckNotifier, SafetyCheckState>(
  (ref) => SafetyCheckNotifier(),
);

class SafetyCheckState {
  final bool isActive;
  final DateTime? startedAt;
  final int alertStep;

  SafetyCheckState({
    required this.isActive,
    this.startedAt,
    this.alertStep = 0,
  });

  SafetyCheckState copyWith({
    bool? isActive,
    DateTime? startedAt,
    int? alertStep,
  }) {
    return SafetyCheckState(
      isActive: isActive ?? this.isActive,
      startedAt: startedAt ?? this.startedAt,
      alertStep: alertStep ?? this.alertStep,
    );
  }
}

class SafetyCheckNotifier extends StateNotifier<SafetyCheckState> {
  SafetyCheckNotifier() : super(SafetyCheckState(isActive: false));

  void activate() {
    state = SafetyCheckState(
      isActive: true,
      startedAt: DateTime.now(),
    );
  }

  void deactivate() {
    state = SafetyCheckState(
      isActive: false,
      startedAt: null,
    );
  }

  void incrementAlertStep() {
    state = state.copyWith(alertStep: state.alertStep + 1);
  }

  //confirmSafe랑 같은거
  void resetAlert() {
    state = state.copyWith(
      startedAt: DateTime.now(),
      alertStep: 0,
    );
  }

  void loadFrom(DateTime startedAt) {
    state = SafetyCheckState(
      isActive: true,
      startedAt: startedAt,
    );
  }
}
