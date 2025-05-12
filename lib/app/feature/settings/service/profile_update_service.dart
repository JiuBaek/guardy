// lib/app/settings/service/profile_update_service.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/api/api_service.dart';
import 'package:template/app/model/user_model.dart';
import 'package:template/app/auth/auth_state.dart';

class ProfileUpdateService {
  static Future<void> updateProfile({
    required BuildContext context,
    required WidgetRef ref,
    required String nickname,
    required String password,
    required String phoneNumber,
    required String nationality,
    required String birthYear,
    required String language,
    required String sex,
    String? difficulties,
    required String emContactName,
    required String emContactNumber,
  }) async {
    final user = ref.read(authStateProvider).user;

    final updatedNickname =
        nickname.isNotEmpty ? nickname : user?.nickname ?? '';
    final updatedPhoneNumber =
        phoneNumber.isNotEmpty ? phoneNumber : user?.phoneNumber ?? '';
    final updatedNationality =
        nationality.isNotEmpty ? nationality : user?.nationality ?? '';
    final updatedBirthYear = int.tryParse(birthYear) ?? user?.birthYear ?? 0;
    final updatedLanguage =
        language.isNotEmpty ? language : user?.language ?? '';
    final updatedSex = sex.isNotEmpty ? sex : user?.sex ?? '';
    final updatedDifficulties =
        difficulties?.isNotEmpty == true ? difficulties : user?.difficulties;
    final updatedEmContactName =
        emContactName.isNotEmpty ? emContactName : user?.emContactName ?? '';
    final updatedEmContactNumber = emContactNumber.isNotEmpty
        ? emContactNumber
        : user?.emContactNumber ?? '';

    final result = await ApiService.I.updateProfile(
      nickname: updatedNickname,
      password: password,
      phoneNumber: updatedPhoneNumber,
      nationality: updatedNationality,
      birthYear: updatedBirthYear,
      language: updatedLanguage,
      sex: updatedSex,
      difficulties: updatedDifficulties,
      emContactName: updatedEmContactName,
      emContactNumber: updatedEmContactNumber,
    );

    result.fold(
      onSuccess: (_) {
        ref
            .read(authStateProvider.notifier)
            .updateState((state) => state.copyWith(
                  user: UserModel(
                    nickname: updatedNickname,
                    phoneNumber: updatedPhoneNumber,
                    nationality: updatedNationality,
                    birthYear: updatedBirthYear,
                    language: updatedLanguage,
                    sex: updatedSex,
                    difficulties: updatedDifficulties,
                    emContactName: updatedEmContactName,
                    emContactNumber: updatedEmContactNumber,
                  ),
                ));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
        Navigator.pop(context);
      },
      onFailure: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: ${error.message}')),
        );
      },
    );
  }
}
