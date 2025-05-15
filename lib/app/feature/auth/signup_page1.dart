// signup_page1.dart
import 'package:flutter/material.dart';
import 'package:guardy/app/routing/router_service.dart';

class SignUpPage1 extends StatefulWidget {
  const SignUpPage1({super.key});

  @override
  State<SignUpPage1> createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _nicknameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    final filled = _nicknameController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty;

    if (filled != _isFilled) {
      setState(() {
        _isFilled = filled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Image.asset('assets/images/signup1.png', height: 120),
              const SizedBox(height: 32),
              const Row(children: [
                Text('Nickname',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )
              ]),
              const SizedBox(height: 5),
              _buildInputField(_nicknameController, "Enter your nickname"),
              const SizedBox(height: 24),
              const Row(children: [
                Text('Password',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(
                  '*',
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )
              ]),
              const SizedBox(height: 5),
              _buildInputField(_passwordController, "Enter your password",
                  obscureText: true),
              const SizedBox(height: 200),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isFilled
                      ? () {
                          RouterService.I.router.push(
                            Routes.signup2,
                            extra: {
                              'nickname': _nicknameController.text.trim(),
                              'password': _passwordController.text.trim(),
                            },
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isFilled ? Colors.black : const Color(0xFF838383),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 48)
            ],
          ),
        ));
  }

  Widget _buildInputField(TextEditingController controller, String hintText,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
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
}
