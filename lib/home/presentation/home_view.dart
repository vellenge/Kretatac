import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/constants/texts/intro_text.dart';

import 'package:kretatac/commons/layout/responsive_center.dart';
import 'package:kretatac/commons/utils/screen_size.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/commons/widgets/bouncing_widget.dart';
import 'package:kretatac/commons/widgets/mire_rotation_widget.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';

import 'package:kretatac/commons/widgets/scale_widget.dart';
import 'package:kretatac/game/application/deck_service.dart';

import 'package:kretatac/game/application/hand_service.dart';
import 'package:kretatac/game/data/deck_repository.dart';
import 'package:kretatac/game/presentation/game_view.dart';
import 'package:kretatac/ideas/data/idea_dto.dart';
import 'package:kretatac/ideas/data/idea_repository.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideasValue = ref.watch(getIdeasListProvider);
    final themeData = Theme.of(context);
    final arrow = SvgPicture.asset(
      'assets/images/icone_pointage_main.svg',
      height: 100,
    );
    final star = SvgPicture.asset('assets/images/star.svg');

    return Theme(
      data: themeData.copyWith(
          dividerTheme: const DividerThemeData(color: Colors.transparent)),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.amber,
            persistentFooterAlignment: AlignmentDirectional.bottomCenter,
            body: AnimatedGradient(
              child: Stack(children: [
                const MireRotationWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
                  child: Column(
                    children: [
                      gapH12,
                      ScaleWidget(
                          child: SvgPicture.asset('assets/images/logo.svg')),
                      Expanded(
                        child: ResponsiveCenter(
                          maxScreenSize: ScreenSize.medium,
                          child: Stack(children: [
                            Container(
                              height: 150,
                              color: Colors.transparent,
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [BouncingWidget(child: arrow)])),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: NeuCard(
                                    cardWidth: double.infinity,
                                    cardColor: Theme.of(context).cardColor,
                                    borderRadius:
                                        BorderRadius.circular(Sizes.p8),
                                    child: Padding(
                                        padding: const EdgeInsets.all(Sizes.p8),
                                        child: SingleChildScrollView(
                                          child: Column(children: [
                                            Text(ref.watch(introTextProvider),
                                                style: themeData
                                                    .textTheme.bodyLarge),
                                            gapH12,
                                            SizedOverflowBox(
                                              size: const Size(800, 150),
                                              // minWidth: 100,
                                              // minHeight: 200,
                                              // maxHeight: 400,
                                              // maxWidth: 600,
                                              child: Transform.rotate(
                                                angle: -pi / 12,
                                                child: NeuText(
                                                    fontSize: 50,
                                                    text: ref.watch(
                                                        problemTextProvider)),
                                              ),
                                            ),
                                            gapH12,
                                            Text(
                                                ref.watch(discoverTextProvider),
                                                style: themeData
                                                    .textTheme.bodyLarge),
                                          ]),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: arrow.height! - 30,
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      StarterWidget(star: star),
                      gapH16
                    ],
                  ),
                ),
              ]),
            )),
      ),
    );
  }
}

class StarterWidget extends StatelessWidget {
  const StarterWidget({
    super.key,
    required this.star,
  });

  final SvgPicture star;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.p12),
      child: ResponsiveCenter(
        maxScreenSize: ScreenSize.small,
        child: Stack(clipBehavior: Clip.none, children: [
          StartButtonCTA(),
          Positioned(top: -30, child: star),
          Positioned(
              right: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: star,
              )),
        ]),
      ),
    );
  }
}

class StartButtonCTA extends HookConsumerWidget {
  StartButtonCTA({
    super.key,
  });

  bool isPressed = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restColor = Theme.of(context).colorScheme.primary;
    final pressedColor = Theme.of(context).colorScheme.tertiary;

    final animationController = useAnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 1),
      initialValue: 1,
    )..repeat(reverse: true);

    final sizeAnimation =
        Tween(begin: 0.95, end: 1.0).animate(animationController);

    return ScaleTransition(
      scale: sizeAnimation,
      child: NeuTextButton(
          onPressed: () {
            ref.read(handServiceNotifierProvider.notifier).getHand();

            isPressed = true;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const GameView(),
            ));
          },
          buttonColor: isPressed ? pressedColor : restColor,
          borderRadius: BorderRadius.circular(Sizes.p16),
          buttonWidth: double.infinity,
          enableAnimation: true,
          text: NeuText(
            text: "C'est parti !",
            fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
            color: Theme.of(context).colorScheme.onPrimary,
          )),
    );
  }
}
