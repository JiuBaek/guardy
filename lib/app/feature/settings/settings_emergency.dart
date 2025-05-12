import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/routing/router_service.dart';
import 'package:template/app/feature/settings/service/profile_update_service.dart';
import 'package:template/app/auth/auth_state.dart';

class SettingsEmergencyContacts extends ConsumerStatefulWidget {
  const SettingsEmergencyContacts({super.key});

  @override
  ConsumerState<SettingsEmergencyContacts> createState() =>
      _SettingsEmergencyContactsState();
}

class _SettingsEmergencyContactsState
    extends ConsumerState<SettingsEmergencyContacts> {
  bool isEditMode = false;

  final TextEditingController contactNameController = TextEditingController();
  final TextEditingController emergencyPhoneController =
      TextEditingController();

  String selectedCountryCode = '';
  final List<String> countries = ['+82', '+81', '+86'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(authStateProvider).user;

    selectedCountryCode = user?.emContactNumber.split(' ').first ?? '';
    emergencyPhoneController.text = user?.emContactNumber.split(' ').last ?? '';
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
            icon:
                const Icon(Icons.arrow_back_ios_new, color: Color(0xFF838383)),
            onPressed: () => RouterService.I.router.pop(),
          ),
          title: Image.asset(
            'assets/images/guardyLogo.png',
            width: 80,
            height: 30,
          )),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEditMode ? 'Edit Emergency Contacts' : 'Emergency Contacts',
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF005DD8),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),

            // Contact Name
            const Text(
              'Emergency Contacts',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 9),
            TextField(
              controller: contactNameController,
              enabled: isEditMode,
              decoration: InputDecoration(
                hintText: 'Change contact name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF838383)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF838383)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFF005DD8)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),

            const SizedBox(height: 24),

            // Emergency Number (국가번호 + 번호)
            const Text(
              'Emergency Number',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 9),
            _buildPhoneInput(),

            const Spacer(),

            // Edit / Save 버튼
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
                        birthYear: (user?.birthYear ?? '').toString(),
                        language: user?.language ?? '',
                        sex: user?.sex ?? '',
                        difficulties: user?.difficulties ?? '',
                        emContactName: contactNameController.text.trim(),
                        emContactNumber:
                            '$selectedCountryCode ${emergencyPhoneController.text.trim()}');
                    _saveEmergencyInfo();
                  } else {
                    setState(() {
                      isEditMode = true;
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
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF838383)),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          isEditMode
              ? DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountryCode,
                    items: countries
                        .map((code) =>
                            DropdownMenuItem(value: code, child: Text(code)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => selectedCountryCode = value!),
                  ),
                )
              : Text(
                  selectedCountryCode,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF838383)),
                ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 0.5,
          ),
          Expanded(
            child: TextField(
              controller: emergencyPhoneController,
              enabled: isEditMode,
              decoration: InputDecoration(
                hintText: isEditMode ? 'Change emergency number' : '',
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveEmergencyInfo() {
    setState(() {
      isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved locally')),
    );
  }
}
