import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/settings/logic/settings_provider.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/auth/auth_service.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF838383)),
            onPressed: () => RouterService.I.router.pop(),
          ),
          title: Image.asset(
            'assets/images/guardyLogo.png',
            width: 80,
            height: 30,
          )),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF005DD8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSettingButton(context, 'Account Info', () {
                    RouterService.I.router.push(Routes.settingsAccountInfo);
                  }),
                  const SizedBox(height: 16),
                  _buildSettingButton(context, 'Personal Details', () {
                    RouterService.I.router.push(Routes.settingsPersonal);
                  }),
                  const SizedBox(height: 16),
                  _buildSettingButton(context, 'Emergency Contacts', () {
                    RouterService.I.router.push(Routes.settingsEmergency);
                  }),
                  const SizedBox(height: 32),
                  _buildLogoutButton(context),
                ],
              ),
            ),
    );
  }

  // 일반 설정 버튼 (Account Info, Personal Details 등)
  Widget _buildSettingButton(
      BuildContext context, String text, VoidCallback onTap) {
    return SizedBox(
      height: 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.black26),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.white,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Log out
  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF005DD8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () async {
          await AuthService.I.logout();
          RouterService.I.router.go(Routes.login);
        },
        child: const Text(
          'Log out',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
