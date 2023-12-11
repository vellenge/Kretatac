import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kretatac/ideas/presentation/widgets/idea_tag.dart';
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
            "Il ne se sent pas tip-top et cherche sur les réseaux une solution. Ton objectif : le convaincre que ta thérapie est la meilleure !",
        onPressed: renderInfo.nextStep,
      );
    },
  ),
  OnboardingStep(
    focusNode: overlayKeys[1],
    titleText: "Joue tes cartes",
    fullscreen: true,
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(100)),
    // ),
    // overlayBehavior: HitTestBehavior.deferToChild,
    onTapCallback: (area, next, close) {
      if (area == TapArea.label ||
          area == TapArea.hole ||
          area == TapArea.overlay) {
        next();
      }
    },
    bodyText:
        "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
    stepBuilder: (context, renderInfo) {
      return StepWidget(
        useCustom: false,
        width: MediaQuery.of(context).size.width,
        title: "Joue tes cartes !",
        rich: Text.rich(TextSpan(children: [
          const TextSpan(text: "Dans ta main se trouvent les  "),
          WidgetSpan(child: IdeaTag.argument()),
          const TextSpan(
              text:
                  """   les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! 
Tu peux aussi choisir les  """),
          WidgetSpan(child: IdeaTag.attribut()),
          const TextSpan(
              text: """  de ta thérapie pour la composer selon ton envie !
"""),
          //TODO add arrow
          const TextSpan(text: "Appuie sur  "),
          WidgetSpan(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset('assets/images/refresh.svg'))),
          const TextSpan(
              text: "  pour piocher de nouvelles cartes à volonté !",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ])),
        text:
            "Dans ta main se trouvent les arguments les plus communs sur les réseaux pour justifier certaines thérapies. Choisis les plus efficaces pour convaincre JPP ! Tu peux aussi choisir les attributs de ta thérapie pour la composer selon ton envie !",
        onPressed: renderInfo.nextStep,
      );
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
