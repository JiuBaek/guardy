// signup_page2.dart
import 'package:flutter/material.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:go_router/go_router.dart';

class SignUpPage2 extends StatefulWidget {
  final GoRouterState state;
  const SignUpPage2({super.key, required this.state});

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  final _phoneController = TextEditingController();
  final _difficultiesController = TextEditingController();

  final List<String> nationalities = ['Korea', 'Japan', 'China'];
  final List<String> birthYears = [
    for (int year = 1980; year <= 2010; year++) year.toString()
  ];
  final List<String> languages = ['Korean', 'English'];
  final List<String> genders = ['Male', 'Female'];
  String? selectedNationality;
  String? selectedBirthYear;
  String? selectedLanguage;
  String? selectedGender;
  String selectedCountryCode = '+82';

  @override
  Widget build(BuildContext context) {
    final args = widget.state.extra as Map<String, dynamic>? ?? {};
    final nickname = args['nickname'] ?? '';
    final password = args['password'] ?? '';

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
        title: const Text(
          'Guardy',
          style: TextStyle(
              color: Color(0xFF005DD8),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xFF005DD8))),
                const SizedBox(height: 8),
                Image.asset('assets/images/signup2.png'),
                const SizedBox(height: 32),
                const Row(children: [
                  Text('Personal Details ',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 17),
                  )
                ]),
                const SizedBox(height: 24),
                _buildPhoneInput(),
                const SizedBox(height: 16),
                _buildDropdown(
                  nationalities,
                  selectedNationality,
                  (value) {
                    setState(() {
                      selectedNationality = value!;
                    });
                  },
                  "Nationality",
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  birthYears,
                  selectedBirthYear,
                  (value) {
                    setState(() {
                      selectedBirthYear = value!;
                    });
                  },
                  "Year of Birth",
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  languages,
                  selectedLanguage,
                  (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                  "Language",
                ),
                const SizedBox(height: 16),
                _buildDropdown(
                  genders,
                  selectedGender,
                  (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  "Sex",
                ),
                const SizedBox(height: 24),
                const Text('Chronic disease / Disability',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 8),
                TextField(
                  controller: _difficultiesController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Any chronic conditions or disabilities?',
                    hintStyle: const TextStyle(color: Color(0xFFD9D9D9)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Color(0xFF005DD8)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      RouterService.I.router.push(
                        Routes.signup3,
                        extra: {
                          'nickname': nickname,
                          'password': password,
                          'phoneNumber':
                              '$selectedCountryCode ${_phoneController.text.trim()}',
                          'nationality': selectedNationality ?? '',
                          'birthYear': selectedBirthYear ?? '',
                          'language': selectedLanguage ?? '',
                          'sex': selectedGender ?? '',
                          'difficulties':
                              _difficultiesController.text.trim().isEmpty
                                  ? null
                                  : _difficultiesController.text.trim(),
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF838383),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text('Next',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 48)
              ],
            ),
          )),
    );
  }

  Widget _buildPhoneInput() {
    final List<String> countries = ['+82', '+81', '+86'];
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF838383)),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.white,
              dropdownColor: Colors.white,
              value: selectedCountryCode,
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Color(0xFF838383)),
              items: countries
                  .map((code) =>
                      DropdownMenuItem(value: code, child: Text(code)))
                  .toList(),
              onChanged: (value) =>
                  setState(() => selectedCountryCode = value!),
              style: const TextStyle(color: Color(0xFF838383), fontSize: 15),
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 0.5,
          ),
          Expanded(
            child: TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
                hintStyle: TextStyle(color: Color(0xFF838383), fontSize: 15),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    List<String> items,
    String? selectedItem,
    ValueChanged<String?> onChanged,
    String hintText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            onChanged: onChanged,
            hint: Text(
              hintText,
              style: const TextStyle(color: Color(0xFF838383), fontSize: 15),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
