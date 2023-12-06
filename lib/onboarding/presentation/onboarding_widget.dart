import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/game/presentation/game_view.dart';
import 'package:kretatac/home/presentation/home_view.dart';

final screenSwitcherProvider = StateProvider<bool>((ref) {
  return false;
});

class OnBoardingWidget extends ConsumerStatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  ConsumerState<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends ConsumerState<OnBoardingWidget> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
    //   final OnboardingState? onboarding = Onboarding.of(context);
    //   if (onboarding != null &&
    //       ref.read(screenSwitcherProvider.notifier).state &&
    //       showOnBoarding) {
    //     onboarding.show();
    //     showOnBoarding = false;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final isReadytoplay = ref.watch(screenSwitcherProvider);

    return isReadytoplay ? GameView() : const HomeView();
  }
}
