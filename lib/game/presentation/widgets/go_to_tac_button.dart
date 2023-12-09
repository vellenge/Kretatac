import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/star_container.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/game/application/persuasion_service.dart';

import 'package:kretatac/results/presentation/tac_view.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class GoToTacButton extends HookConsumerWidget {
  const GoToTacButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConvinced = ref.watch(persuasionServiceProvider) >= 1;

    final controller = useAnimationController(
        lowerBound: 0.6, upperBound: 1, duration: const Duration(seconds: 1))
      ..reverse();

    return isConvinced
        ? Expanded(
            flex: 2,
            child: NeuTextButton(
              buttonColor:
                  Theme.of(context).extension<ExtendedColor>()!.accentColor,
              borderRadius: BorderRadius.circular(Sizes.p8),
              buttonHeight: 60,
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const TacView())),
              enableAnimation: true,
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Découvrir ma ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: OverflowBox(
                      minHeight: 100,
                      minWidth: 100,
                      maxHeight: 200,
                      maxWidth: 200,
                      child: StarContainer(
                        height: 60,
                        innerRadiusRatio: 0.8,
                        child: Transform.rotate(
                            angle: 100,
                            child: const NeuText(
                              text: 'TAC',
                              fontSize: Sizes.p32,
                            )),
                      )
                          .animate(
                            controller: controller,
                            autoPlay: true,
                            onComplete: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .scale(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.elasticInOut),
                    ),
                  )
                ],
              ),
            ).animate().scaleXY().fadeIn(),
          )
        : const SizedBox.shrink();
  }
}
