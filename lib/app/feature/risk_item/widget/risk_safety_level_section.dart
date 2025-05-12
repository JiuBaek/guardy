import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/app/feature/home/logic/home_provider.dart';

class RiskSafetyLevelSection extends ConsumerWidget {
  final int level;
  final String summary;

  const RiskSafetyLevelSection(
      {super.key, required this.level, required this.summary});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeProvider.notifier);

    return GestureDetector(
      onTap: () => _showSafetyLevelDialog(context, notifier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Safety Level $level (${safetyLevelInfo[level]?['label']})',
                    style: TextStyle(
                      color: _getColor(safetyLevelInfo[level]?['color']),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Container(
                    height: 3,
                    color: _getColor(safetyLevelInfo[level]?['color']),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.error_outline,
              color: _getColor(safetyLevelInfo[level]?['color']),
              size: 21,
            ),
          ]),
          const SizedBox(height: 7),
          Image.asset(
            'assets/images/${safetyLevelInfo[level]?['color']}_owl_active.png',
            width: 36,
            height: 41.73,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            summary,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  void _showSafetyLevelDialog(BuildContext context, HomeProvider notifier) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Safety levels based on crime rate and police access.',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSafetyLevelIcon('Very Safe', 'blue', notifier),
                      _buildSafetyLevelIcon('Safe', 'green', notifier),
                      _buildSafetyLevelIcon('Normal', 'yellow', notifier),
                      _buildSafetyLevelIcon('Caution', 'orange', notifier),
                      _buildSafetyLevelIcon('Danger', 'red', notifier),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Safety levels based on police presence and reported incidents.',
                    style: TextStyle(color: Colors.black45, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSafetyLevelIcon(
      String label, String color, HomeProvider notifier) {
    final isActive = (safetyLevelInfo[level]?['color'] == color);
    final assetName = isActive
        ? 'assets/images/${color}_owl_active.png'
        : 'assets/images/${color}_owl_inactive.png';

    return Column(
      children: [
        Image.asset(assetName, width: 50, height: 50),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _getColor(String? colorName) {
    switch (colorName) {
      case 'blue':
        return const Color(0xFF005DD8);
      case 'green':
        return const Color(0xFF42BC00);
      case 'yellow':
        return const Color(0xFFFFD600);
      case 'orange':
        return const Color(0xFFFF9000);
      case 'red':
        return const Color(0xFFFF0000);
      default:
        return Colors.grey;
    }
  }

  static const Map<int, Map<String, String>> safetyLevelInfo = {
    1: {
      'label': 'Very Safe',
      'color': 'blue',
    },
    2: {
      'label': 'Safe',
      'color': 'green',
    },
    3: {
      'label': 'Normal',
      'color': 'yellow',
    },
    4: {
      'label': 'Caution',
      'color': 'orange',
    },
    5: {
      'label': 'Danger',
      'color': 'red',
    },
  };
}
