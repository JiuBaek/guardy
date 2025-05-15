import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/feature/settings/service/profile_update_service.dart';
import 'package:guardy/app/auth/auth_state.dart';

class SettingsAccountInfo extends ConsumerStatefulWidget {
  const SettingsAccountInfo({super.key});

  @override
  ConsumerState<SettingsAccountInfo> createState() =>
      _SettingsAccountInfoState();
}

class _SettingsAccountInfoState extends ConsumerState<SettingsAccountInfo> {
  bool isEditMode = false;

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authStateProvider).user;

    nicknameController.text = user?.nickname ?? '';
    passwordController.text = '*********';
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authStateProvider).user;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF838383)),
            onPressed: () => RouterService.I.router.pop(),
          ),
          title: Image.asset(
            'assets/images/guardyLogo.png',
            width: 80,
            height: 30,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEditMode ? 'Edit Account Info' : 'Account Info',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF005DD8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Nickname Field
            const Text(
              'Nickname',
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 7),
            TextField(
              controller: nicknameController,
              enabled: isEditMode,
              decoration: InputDecoration(
                hintText: 'Change your nickname',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF838383)),
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFF838383))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF005DD8)),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Password Field
            const Text(
              'Password',
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            const SizedBox(height: 7),
            TextField(
              controller: passwordController,
              enabled: isEditMode,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: 'Change your password',
                suffixIcon: isEditMode
                    ? IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF838383)),
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Color(0xFF838383))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF005DD8)),
                ),
              ),
            ),
            const Spacer(),

            // Edit or Save Button
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditMode) {
                    ProfileUpdateService.updateProfile(
                        context: context,
                        ref: ref,
                        nickname: user?.nickname ?? '',
                        password: '',
                        phoneNumber: user?.phoneNumber ?? '',
                        nationality: user?.nationality ?? '',
                        birthYear: (user?.birthYear ?? 0).toString(),
                        language: user?.language ?? '',
                        sex: user?.sex ?? '',
                        difficulties: user?.difficulties ?? '',
                        emContactName: user?.emContactName ?? '',
                        emContactNumber: user?.emContactNumber ?? '');
                    _saveAccountInfo();
                  } else {
                    // Edit Mode switch
                    setState(() {
                      isEditMode = true;
                      passwordController.text = '';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isEditMode ? const Color(0xFF005DD8) : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  isEditMode ? 'Save' : 'Edit',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _saveAccountInfo() {
    setState(() {
      isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings is successfully saved')),
    );
  }
}
