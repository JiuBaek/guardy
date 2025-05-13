import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/home/logic/home_provider.dart';
import 'package:guardy/app/feature/home/logic/home_state.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/auth/auth_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).fetchMode();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final notifier = ref.watch(homeProvider.notifier);
    final authState = ref.read(authStateProvider);
    final String nickname = authState.user?.nickname ?? 'User';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: const SizedBox.shrink(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: '$nickname!',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Guardy is here to protect.\nLet\'s see if there\'s anything risky around you.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            _buildActiveButton(notifier, state.isActive),
            const SizedBox(height: 16),
            Image.asset(
              state.isActive
                  ? 'assets/images/blue_owl_active.png'
                  : 'assets/images/blue_owl_inactive.png',
              width: 50,
              height: 58,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _buildBottomCard(state, notifier),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActiveButton(HomeProvider notifier, bool isActive) {
    return TextButton(
      onPressed: () {
        notifier.toggleActive();
      },
      style: TextButton.styleFrom(
        backgroundColor: isActive ? const Color(0xFF005DD8) : Colors.white,
        side: const BorderSide(color: Color(0xFF005DD8)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
      child: Text(
        isActive ? 'Active ON' : 'Active OFF',
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF005DD8),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomCard(HomeState state, HomeProvider notifier) {
    if (state.isActive == false) {
      return _buildOffCard();
    } else if (state.safetyChecked == false) {
      return _buildReadySafetyCard(state, notifier);
    } else {
      return _buildCheckedSafetyCard(state, notifier);
    }
  }

  Widget _buildOffCard() {
    return Center(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: _cardDecoration(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tap the Active button to check your safety',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          )),
    );
  }

  Widget _buildReadySafetyCard(HomeState state, HomeProvider notifier) {
    return Container(
      decoration: _cardDecoration(),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('You are currently in',
                  style: TextStyle(color: Colors.black54)),
              GestureDetector(
                  onTap: () {
                    notifier.refreshLocationOnly();
                  },
                  child: const Icon(
                    Icons.refresh,
                    color: Color(0xFF838383),
                    size: 14,
                  ))
            ],
          ),
          const SizedBox(height: 8),
          Text(
            state.location,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Color(0xFF838383),
            thickness: 0.5,
            endIndent: 0,
            height: 32,
          ),
          Expanded(
            child: Center(
              child: state.isLoading
                  ? Image.asset(
                      'assets/owlDance.gif',
                      width: 150,
                      height: 150,
                    )
                  : OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                '⚠️ This can take more than a minute, please wait.'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        notifier.performSafetyCheck(); // 이 안에서 loading 처리
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        side: const BorderSide(color: Color(0xFF005DD8)),
                      ),
                      child: const Text('Safety Check'),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckedSafetyCard(HomeState state, HomeProvider notifier) {
    return Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 4),
        decoration: _cardDecoration(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('You are currently in',
                    style: TextStyle(color: Colors.black54)),
                GestureDetector(
                    onTap: () {
                      notifier.refreshLocationOnly();
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Color(0xFF838383),
                      size: 14,
                    ))
              ]),
              const SizedBox(height: 8),
              Text(
                state.location,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Color(0xFF838383),
                thickness: 0.5,
                indent: 5,
                endIndent: 5,
                height: 32,
              ),
              if (state.safetyLevel != null)
                Text(
                  state.safetyLevel!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF005DD8),
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 8),
              if (state.safetyDescription != null)
                Text(
                  state.safetyDescription!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  RouterService.I.router.push(Routes.riskItem);
                },
                child: const Text(
                  'Tap for details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    color: Color(0xFF005DD8),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.black26),
    );
  }
}
