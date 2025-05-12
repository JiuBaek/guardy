import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/home/logic/home_provider.dart';
import 'package:guardy/app/feature/risk_item/widget/risk_item_widget.dart';

class RiskDetailSection extends ConsumerWidget {
  const RiskDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    final List<MapEntry<String, String>> dangerFactorsList = state.risks
        .map((risk) => MapEntry(risk.title, risk.description))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dangerFactorsList.length,
          separatorBuilder: (_, __) => const Divider(
            color: Color(0xFFD9D9D9),
            thickness: 0.5,
            height: 40,
          ),
          itemBuilder: (context, index) {
            final entry = dangerFactorsList[index];
            return RiskItem(
              title: entry.key,
              content: entry.value.isNotEmpty
                  ? entry.value
                  : "No description provided",
            );
          },
        ),
      ],
    );
  }
}
