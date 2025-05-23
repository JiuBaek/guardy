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
  bool _isFilled = false;

  final List<String> nationalities = [
    'Australia',
    'Bangladesh',
    'Brunei',
    'Cambodia',
    'China',
    'Fiji',
    'Hong Kong',
    'India',
    'Indonesia',
    'Japan',
    'Kiribati',
    'Laos',
    'Macau',
    'Malaysia',
    'Marshall Islands',
    'Micronesia',
    'Mongolia',
    'Myanmar',
    'Nauru',
    'Nepal',
    'New Zealand',
    'Pakistan',
    'Palau',
    'Papua New Guinea',
    'Philippines',
    'Samoa',
    'Singapore',
    'Solomon Islands',
    'South Korea',
    'Sri Lanka',
    'Taiwan',
    'Thailand',
    'Tonga',
    'Tuvalu',
    'Vanuatu',
    'Vietnam',
  ];

  final List<String> birthYears = [
    for (int year = 1925; year <= 2020; year++) year.toString()
  ];
  final List<String> languages = ['Korean', 'English'];
  final List<String> genders = ['Male', 'Female'];
  String? selectedNationality;
  String? selectedBirthYear;
  String? selectedLanguage;
  String? selectedGender;
  String selectedCountryCode = '+82';

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_checkFields);
    _difficultiesController.addListener(_checkFields);
  }

  void _checkFields() {
    final phoneFilled = _phoneController.text.trim().isNotEmpty;
    final dropdownsFilled = selectedNationality != null &&
        selectedBirthYear != null &&
        selectedLanguage != null &&
        selectedGender != null;

    final filled = phoneFilled && dropdownsFilled;

    if (filled != _isFilled) {
      setState(() {
        _isFilled = filled;
      });
    }
  }

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
        title: Image.asset(
              'assets/images/guardyLogo.png',
              width: 80,
              height: 30,
            )),
      
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
                    onPressed: _isFilled
                        ? () {
                            RouterService.I.router.push(
                              Routes.signup3,
                              extra: {
                                'nickname': nickname,
                                'password': password,
                                'phoneNumber':
                                    '$selectedCountryCode ${_phoneController.text.trim()}',
                                'nationality': selectedNationality!,
                                'birthYear': selectedBirthYear!,
                                'language': selectedLanguage!,
                                'sex': selectedGender!,
                                'difficulties':
                                    _difficultiesController.text.trim().isEmpty
                                        ? null
                                        : _difficultiesController.text.trim(),
                              },
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isFilled ? Colors.black : const Color(0xFF838383),
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
    final List<String> countries = [
      '+61',
      '+880',
      '+673',
      '+855',
      '+86',
      '+679',
      '+852',
      '+91',
      '+62',
      '+81',
      '+686',
      '+856',
      '+853',
      '+60',
      '+692',
      '+691',
      '+976',
      '+95',
      '+674',
      '+977',
      '+64',
      '+92',
      '+680',
      '+675',
      '+63',
      '+685',
      '+65',
      '+677',
      '+82',
      '+94',
      '+886',
      '+66',
      '+676'
    ];
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF838383)),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
