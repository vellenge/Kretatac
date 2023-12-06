import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';

import 'package:kretatac/commons/overlay_widget.dart';
import 'package:kretatac/onboarding/presentation/step_widget.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

List<FocusNode> overlayKeys = [
  FocusNode(debugLabel: 'step 1'),
  FocusNode(debugLabel: 'step 2'),
  FocusNode(debugLabel: 'step 3'),
];

final overlayKeysProvider = Provider<List<FocusNode>>((ref) {
  return overlayKeys;
});

List<OnboardingStep> onBoardingSteps = [
  OnboardingStep(
    focusNode: overlayKeys[0],
    titleText: "Lui, c'est Jean-Peuplu",
    stepBuilder: (context, renderInfo) {
      return StepWidget(
        title: "Lui, c'est Jean-Peuplu",
        text:
            "Il ne sent pas tip-top et cherche sur les réseaux une solution. Ton objectif : le convaincre que ta thérapie est la meilleure !",
        onPressed: renderInfo.nextStep,
      );
    },
  ),
  OnboardingStep(
    focusNode: overlayKeys[1],
    titleText: "Joue tes cartes",
    fullscreen: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
    overlayBehavior: HitTestBehavior.opaque,
    bodyText:
        "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
    stepBuilder: (context, renderInfo) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          OverlayWidget(
            horizontalOffset: 0,
            verticalOffset: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p4),
              child: GestureDetector(
                onTap: renderInfo.nextStep,
                child: StepWidget(
                  useCustom: true,
                  width: MediaQuery.of(context).size.width,
                  title: "Joue tes cartes !",
                  text:
                      "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
                  onPressed: renderInfo.nextStep,
                ),
              ),
            ),
          )
        ],
      );

      // return OverlayContainer(
      //   offset: const Offset(0, 200),
      //   overlay: Container(
      //     width: 300,
      //     child: StepWidget(
      //       title: "Joue tes cartes !",
      //       text:
      //           "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
      //       onPressed: renderInfo.nextStep,
      //     ),
      //   ),
      // );

      // return Overlay(
      //   clipBehavior: Clip.none,
      //   initialEntries: [
      //     OverlayEntry(
      //       builder: (context) {
      //               final RenderBox renderBoxRed = context
      //           .findRenderObject(); // BuildContext of the target element
      //       final position = renderBoxRed.localToGlobal(Offset.zero);
      //       final size = renderBoxRed.size;

      //       return Positioned(
      //         child: StepWidget(
      //           title: "Joue tes cartes !",
      //           text:
      //               "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
      //           onPressed: renderInfo.nextStep,
      //         ),
      //       );
      //       }
      //     ),
      //   ],
      // );
    },
  ),
  OnboardingStep(
    focusNode: overlayKeys[2],
    titleText: "Surveille tes points",
    stepBuilder: (context, renderInfo) {
      return StepWidget(
        title: "Attention à tes points",
        text:
            "Chaque carte a un coût indiqué par un chiffre. Tu disposes de 20 points pour remplir la jauge de persuasion de Jean-Peuplu !",
        buttonText: "J'ai compris",
        onPressed: renderInfo.close,
      );
    },
  ),
];

final onBoardingStepsProvider = Provider<List<OnboardingStep>>((ref) {
  return onBoardingSteps;
});
