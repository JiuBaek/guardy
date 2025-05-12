import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/home/logic/home_provider.dart';
import 'package:guardy/app/feature/risk_item/widget/risk_safety_level_section.dart';
import 'package:guardy/app/feature/risk_item/widget/risk_location_section.dart';
import 'package:guardy/app/feature/risk_item/widget/risk_detail_section.dart';
import 'package:guardy/app/feature/risk_item/widget/risk_footer.dart';
import 'package:guardy/app/routing/router_service.dart';

class RiskItemPage extends ConsumerWidget {
  const RiskItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final risk = homeState.risks.isNotEmpty ? homeState.risks[0] : null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF838383)),
            onPressed: () => RouterService.I.router.pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                RouterService.I.router.push(Routes.settings);
              },
              icon:
                  const Icon(Icons.settings_outlined, color: Color(0xFF838383)),
            ),
          ],
          title: Image.asset(
            'assets/images/guardyLogo.png',
            width: 80,
            height: 30,
          )),
      body: risk == null
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  RiskLocationSection(location: homeState.location),
                  const SizedBox(height: 24),
                  const Text(
                    'Overall Safety Level',
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    color: Color(0xFFD9D9D9),
                    thickness: 0.5,
                    height: 40,
                  ),
                  RiskSafetyLevelSection(
                    level: risk.level!,
                    summary: homeState.safetyDescription ??
                        'no summery for this risk information',
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Detailed Information',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const RiskDetailSection(),
                  const Divider(
                    color: Color(0xFFD9D9D9),
                    thickness: 0.5,
                    height: 24,
                  ),
                  const RiskFooter(),
                ],
              ),
            ),
    );
  }
}
