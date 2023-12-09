// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/character/widget/character_widget.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';

import 'package:kretatac/commons/widgets/scale_widget.dart';
import 'package:kretatac/game/application/can_play_service.dart';
import 'package:kretatac/game/application/game_service.dart';
import 'package:kretatac/game/application/hand_service.dart';
import 'package:kretatac/game/application/persuasion_service.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';

import 'package:kretatac/game/presentation/controllers/carousel_controller.dart';
import 'package:kretatac/game/presentation/controllers/flip_controller.dart';
import 'package:kretatac/game/presentation/draw_deck_animation.dart';
import 'package:kretatac/game/presentation/widgets/go_to_tac_button.dart';
import 'package:kretatac/game/presentation/widgets/play_button.dart';
import 'package:kretatac/game/presentation/widgets/wallet_and_jauge_widget.dart';

import 'package:kretatac/ideas/presentation/widgets/idea_card.dart';
import 'package:kretatac/ideas/presentation/widgets/recto_idea_card.dart';
import 'package:kretatac/main.dart';
import 'package:kretatac/onboarding/data/onboarding_steps.dart';

import 'package:onboarding_overlay/onboarding_overlay.dart';

// ignore: must_be_immutable
class GameView extends HookConsumerWidget {
  GameView({super.key});

  bool showOnBoarding = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('GameView built');

    final onBoardingNodes = ref.watch(overlayKeysProvider);
    final handValue = ref.watch(handServiceNotifierProvider);
    final playedValue = ref.watch(playedIdeasServiceProvider);
    final canPlay = ref.watch(canPlayProvider);
    final isConvinced =
        ref.watch(persuasionServiceProvider.notifier).isConvinced;

    final width = MediaQuery.of(context).size.width;

    final currentIndex = useState<int?>(0);
    debugPrint('current index is ${currentIndex.value.toString()}');

    final CarouselController _controller = useCarouselController();
    final scaleController =
        useAnimationController(duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    final scaleAnimation =
        Tween(begin: 0.95, end: 1.0).animate(scaleController);

    final mustDrawFlip = useState(false);

    useState(Timer(const Duration(milliseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        final OnboardingState? onboarding = Onboarding.of(context);
        if (onboarding != null && showOnBoarding) {
          onboarding.show();
          showOnBoarding = false;
        }
      });
    }));

    ref.listen(drawFlipControllerProvider, (previous, next) {
      if (next) {
        mustDrawFlip.value = true;
      }
    });

    final flipController = useAnimationController(
      initialValue: 0,
      duration: const Duration(seconds: 1),
    );

    ref.listen(flipControllerProvider, (previous, next) {
      if (next == true) {
        debugPrint("let's flip");
        flipController.reset();
        flipController.forward();
        ref.read(flipControllerProvider.notifier).state = false;
      }
    });

    ref.listen(
      handServiceNotifierProvider,
      (previous, next) {
        if (currentIndex.value! >= next.length) {
          currentIndex.value = next.length - 1;
        }
        if (previous != next) {}
      },
    );

    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          body: AnimatedGradient(
            child: (handValue.isNotEmpty)
                ? Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Focus(
                          focusNode: overlayKeys[2],
                          child: const WalletAndJaugeWidget()),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Sizes.p4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Focus(
                                    focusNode: onBoardingNodes[0],
                                    child: const CharacterWidget()),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(Sizes.p4),
                                      color: Colors.transparent,
                                      border: Border.all(width: Sizes.p4)),
                                  height: 100,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        ...playedValue.map(
                                          (e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: Sizes.p8),
                                            width: 40,
                                            child: RectoIdeaWidget(
                                              showCost: false,
                                              idea: e,
                                              onPressed: () {
                                                ref
                                                    .read(gameServiceProvider
                                                        .notifier)
                                                    .retrieveIdeaFromTableToHand(
                                                        e);
                                              },
                                            )
                                                .animate(
                                                    controller:
                                                        useAnimationController(
                                                            lowerBound: 0.6))
                                                .scale(
                                                    curve: Curves.elasticInOut),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Focus(
                          descendantsAreTraversable: true,
                          descendantsAreFocusable: true,
                          child: RepaintBoundary(
                            child: CarouselSlider.builder(
                                carouselController: _controller,
                                itemCount: handValue.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: ScaleWidget(
                                      isActive: index == currentIndex.value,
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      child: MyNeuContainer(
                                        idea: handValue[index]!,
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  initialPage:
                                      currentIndex.value! > handValue.length - 1
                                          ? handValue.length - 1
                                          : currentIndex.value!,
                                  animateToClosest: false,
                                  enableInfiniteScroll: false,
                                  viewportFraction: 0.8,
                                  enlargeCenterPage: true,
                                  height: 600,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) =>
                                      currentIndex.value = index,
                                )),
                          ),
                        ),
                      ),
                      Flexible(
                        // flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 1,
                              child: PlayButton(
                                  icon: canPlay
                                      ? Icons.play_arrow
                                      : Icons.play_disabled_rounded,
                                  width: width * 0.5,
                                  // borderRadius: BorderRadius.circular(Sizes.p12),
                                  enableAnimation: canPlay,
                                  color: canPlay
                                      ? Theme.of(context)
                                          .extension<ExtendedColor>()!
                                          .ctaColor
                                      : Colors.grey,
                                  text: Text(
                                    canPlay ? 'Utiliser' : 'Points épuisés !',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: canPlay
                                      ? () async {
                                          if (handValue.isNotEmpty) {
                                            await ref
                                                .read(gameServiceProvider
                                                    .notifier)
                                                .playCard(handValue[
                                                    currentIndex.value!]!);
                                            // currentIndex.value = currentIndex.value! - 1;
                                          }
                                        }
                                      : null),
                            ),
                            if (isConvinced) const GoToTacButton()
                          ],
                        ),
                      ),
                      gapH8,
                      Focus(
                        focusNode: overlayKeys[1],
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ClipRect(
                            clipBehavior: Clip.hardEdge,
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            strokeAlign:
                                                BorderSide.strokeAlignInside,
                                            width: Sizes.p4),
                                        borderRadius:
                                            BorderRadius.circular(Sizes.p4)),
                                    width: 80,
                                    child: const DrawDeckAnimation()),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,

                                    // itemCount: handValue.length,
                                    children: handValue
                                        .map((idea) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: Sizes.p4),
                                              child: SizedBox(
                                                width: 60,
                                                child: RectoIdeaWidget(
                                                    idea: idea!,
                                                    onPressed: () async {
                                                      await _controller
                                                          .animateToPage(
                                                              handValue.indexOf(
                                                                  idea));
                                                    }),
                                              ),
                                            )
                                                .animate(
                                                    onComplete: (controller) {
                                                      debugPrint(
                                                          "card flip has completed");
                                                      mustDrawFlip.value =
                                                          false;
                                                    },
                                                    // autoPlay: false,
                                                    controller: flipController)
                                                .flipH(
                                                    begin: handValue.indexOf(
                                                                    idea) !=
                                                                0 &&
                                                            mustDrawFlip.value
                                                        ? 0
                                                        : 1))
                                        .toList()
                                        .animate(
                                          delay: 200.ms,
                                          interval: 200.ms,
                                          onComplete: (controller) {
                                            // controller.reset();
                                            debugPrint(
                                                "animate list has completed");
                                          },
                                        )
                                        .flipH(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          )),
    );
  }
}
