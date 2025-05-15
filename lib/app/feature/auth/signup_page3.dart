import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:guardy/app/model/signup_request_model.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/auth/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignUpPage3 extends StatefulWidget {
  final GoRouterState state;
  const SignUpPage3({super.key, required this.state});

  @override
  State<SignUpPage3> createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  final _emergencyNameController = TextEditingController();
  final _emergencyNumberController = TextEditingController();
  bool _isFilled = false;

  String selectedCountryCode = '+82';

  @override
  void initState() {
    super.initState();
    _emergencyNameController.addListener(_checkFields);
    _emergencyNumberController.addListener(_checkFields);
  }

  void _checkFields() {
    final filled = _emergencyNameController.text.trim().isNotEmpty &&
        _emergencyNumberController.text.trim().isNotEmpty;

    if (filled != _isFilled) {
      setState(() {
        _isFilled = filled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.state.extra as Map<String, dynamic>? ?? {};

    debugPrint(' Signup args: $args');

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xFF005DD8))),
              const SizedBox(height: 8),
              Image.asset('assets/images/signup3.png'),
              const SizedBox(height: 32),
              const Row(children: [
                Text('Emergency Contacts',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )
              ]),
              const SizedBox(height: 5),
              _buildInputField(_emergencyNameController, "Contact Name"),
              const SizedBox(height: 24),
              const Row(children: [
                Text('Emergency Numbers',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )
              ]),
              const SizedBox(height: 5),
              _buildPhoneInput(),
              const SizedBox(height: 200),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isFilled
                      ? () async {
                          final emergencyPhoneNumber =
                              '$selectedCountryCode ${_emergencyNumberController.text.trim()}';
                          final fcmToken =
                              await FirebaseMessaging.instance.getToken();
                          if (fcmToken == null || fcmToken.isEmpty) return;

                          final signupData = SignupRequestModel(
                            nickname: args['nickname'],
                            password: args['password'],
                            phoneNumber: args['phoneNumber'],
                            nationality: args['nationality'],
                            birthYear: int.parse(args['birthYear']),
                            language: args['language'],
                            sex: args['sex'],
                            difficulties: args['difficulties'],
                            emContactName: _emergencyNameController.text.trim(),
                            emContactNumber: emergencyPhoneNumber,
                            fcmToken: fcmToken,
                          );

                          final result = await AuthService.I.signUp(signupData);
                          result.fold(
                            onSuccess: (_) {
                              //
                            },
                            onFailure: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('sign up is failed')),
                              );
                            },
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _isFilled
                          ? const Color(0xFF005DD8)
                          : const Color(0xFF838383),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text('Create',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(height: 48)
            ],
          ),
        ));
  }

  Widget _buildInputField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFD9D9D9), fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFF005DD8)),
        ),
      ),
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
              controller: _emergencyNumberController,
              decoration: const InputDecoration(
                hintText: "Enter emergency number",
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
}
