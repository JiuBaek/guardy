import 'package:flutter/material.dart';
import 'package:guardy/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardy/app/feature/home/logic/home_provider.dart';
import 'package:guardy/app/feature/home/logic/home_state.dart';
import 'package:guardy/app/routing/router_service.dart';
import 'package:guardy/app/auth/auth_state.dart';
import 'package:guardy/app/feature/home/widget/owl_dance_player.dart';
import 'package:guardy/app/api/api_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool showOwl = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).fetchMode();
      ref.watch(homeProvider.notifier).requestNotificationPermission();
      Service.setupFirebaseMessagingHandlers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    final notifier = ref.watch(homeProvider.notifier);
    final authState = ref.read(authStateProvider);
    final String nickname = authState.user?.nickname ?? 'User';

    if (state.isActive && showOwl) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            setState(() {
              showOwl = false;
            });
          }
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () async {
                await ApiService.I.safetyCheckin();
                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Color(0xFF005DD8),
                      content: Text(
                        ' ✓ safety check finish',
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(seconds: 1, milliseconds: 500)),
                );
              },
              icon: const Icon(Icons.check)),
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
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: showOwl
                        ? Image.asset(
                            state.isActive
                                ? 'assets/images/blue_owl_active.png'
                                : 'assets/images/blue_owl_inactive.png',
                            key: const ValueKey('owl'),
                            width: 50,
                            height: 58,
                            fit: BoxFit.contain,
                          )
                        : const SizedBox.shrink(key: ValueKey('empty')),
                  ),
                  SizedBox(height: showOwl ? 18 : 0),
                ],
              ),
            ),
            Expanded(
              child: AnimatedSlide(
                offset: !showOwl ? Offset.zero : const Offset(0, 0.05),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: _buildBottomCard(state, notifier),
                ),
              ),
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
      onPressed: () async {
        notifier.toggleActive();

        final nowActive = ref.read(homeProvider).isActive;

        if (!nowActive) {
          setState(() {
            showOwl = true;
          });
          return;
        }

        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          setState(() {
            showOwl = false;
          });
        }
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
                  ? const OwlDancePlayer()
                  : OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor: Color(0xFF005DD8),
                              content: Text(
                                ' ⚠️ This can take more than a minute, please wait.',
                                style: TextStyle(color: Colors.white),
                              ),
                              duration:
                                  Duration(seconds: 1, milliseconds: 500)),
                        );
                        notifier.performSafetyCheck();
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
              const SizedBox(
                height: 48,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.safetyLevel != null)
                    Text(
                      state.safetyLevel!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF005DD8),
                        fontSize: 17,
                      ),
                    ),
                  const SizedBox(height: 8),
                  if (state.safetyDescription != null)
                    Text(
                      state.safetyDescription!,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black87),
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
