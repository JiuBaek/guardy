import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/routing/router_service.dart';
import 'package:template/app/feature/settings/service/profile_update_service.dart';
import 'package:template/app/auth/auth_state.dart';

class SettingsPersonal extends ConsumerStatefulWidget {
  const SettingsPersonal({super.key});

  @override
  ConsumerState<SettingsPersonal> createState() => _SettingsPersonalState();
}

class _SettingsPersonalState extends ConsumerState<SettingsPersonal> {
  bool isEditMode = false;

  // Controllers and selected values
  final TextEditingController phoneController = TextEditingController();
  String selectedCountryCode = '';
  String selectedNationality = '';
  String selectedBirthYear = '';
  String selectedLanguage = '';
  String selectedGender = '';
  final TextEditingController diseaseController = TextEditingController();

  // Dropdown options
  final List<String> countries = ['+82', '+81', '+86'];
  final List<String> nationalities = ['Korea', 'Japan', 'China'];
  final List<String> birthYears = [
    for (int year = 1925; year <= 2020; year++) year.toString()
  ];
  final List<String> languages = ['Korean', 'English'];
  final List<String> genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    final user = ref.read(authStateProvider).user;

    selectedCountryCode = user?.phoneNumber.split(' ').first ?? '';
    phoneController.text = user?.phoneNumber.split(' ').last ?? '';
    selectedNationality = user?.nationality ?? '';
    selectedBirthYear = user?.birthYear.toString() ?? '';
    selectedLanguage = user?.language ?? '';
    selectedGender = user?.sex ?? '';
    diseaseController.text = user?.difficulties ?? '';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                isEditMode ? 'Edit Personal Details' : 'Personal Details',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF005DD8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),

              _buildPhoneInput(),
              const SizedBox(height: 24),

              _buildDropdown(nationalities, selectedNationality, (value) {
                setState(() => selectedNationality = value!);
              }),
              const SizedBox(height: 24),

              _buildDropdown(birthYears, selectedBirthYear, (value) {
                setState(() => selectedBirthYear = value!);
              }),
              const SizedBox(height: 24),

              _buildDropdown(languages, selectedLanguage, (value) {
                setState(() => selectedLanguage = value!);
              }),
              const SizedBox(height: 24),

              _buildDropdown(genders, selectedGender, (value) {
                setState(() => selectedGender = value!);
              }),
              const SizedBox(height: 24),

              const Text(
                'Chronic disease / Disability',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: diseaseController,
                enabled: isEditMode,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Change chronic disease / disability',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF838383)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF838383)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFF005DD8)),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Edit/Save 버튼
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
                          phoneNumber:
                              '$selectedCountryCode ${phoneController.text.trim()}',
                          nationality: selectedNationality,
                          birthYear: selectedBirthYear,
                          language: selectedLanguage,
                          sex: selectedGender,
                          difficulties: diseaseController.text.trim(),
                          emContactName: user?.emContactName ?? '',
                          emContactNumber: user?.emContactNumber ?? '');
                      _savePersonalInfo();
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
            ],
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          isEditMode
              ? DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: selectedCountryCode,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Color(0xFFD9D9D9)),
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
              controller: phoneController,
              enabled: isEditMode,
              decoration: InputDecoration(
                hintText: isEditMode ? 'Edit your phone number' : '',
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String selectedItem,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF838383)),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            value: selectedItem,
            isExpanded: true,
            underline: const SizedBox(),
            icon:
                const Icon(Icons.keyboard_arrow_down, color: Color(0xFF838383)),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: isEditMode ? onChanged : null,
          ),
        ),
      ],
    );
  }

  void _savePersonalInfo() {
    setState(() {
      isEditMode = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings saved locally')),
    );
  }
}
