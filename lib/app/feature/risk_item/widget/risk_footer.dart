import 'package:flutter/material.dart';

class RiskFooter extends StatelessWidget {
  const RiskFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Powered by Gemini',
        style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
        ),
      ),
    );
  }
}
