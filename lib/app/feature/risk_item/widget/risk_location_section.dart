import 'package:flutter/material.dart';

class RiskLocationSection extends StatelessWidget {
  final String location;

  const RiskLocationSection({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Text(
          'You are currently in',
          style: TextStyle(color: Color(0xFF838383), fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          location,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
