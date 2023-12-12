import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/star_container.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/counter_tag/domain/counter_tag.dart';
import 'package:kretatac/counter_tag/presentation/counter_tag_card.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

final List<Color> badgesColor = [
  const Color.fromARGB(255, 15, 222, 202),
  const Color.fromARGB(255, 248, 198, 61),
  const Color.fromARGB(255, 81, 192, 33),
  const Color.fromARGB(255, 238, 147, 97),
  const Color.fromARGB(255, 239, 211, 54),
];

final rand = Random();
const int maxPoints = 7;
const String placeholder = 'assets/images/refresh.svg';

class CounterTagbadge extends HookWidget {
  CounterTagbadge(
      {super.key, this.showTitle = true, required this.counterTag, this.onTap})
      : points = rand.nextInt(maxPoints).toDouble() + 3,
        color = badgesColor[rand.nextInt(badgesColor.length - 1)];

  const CounterTagbadge.fixedPoints(
      {super.key,
      this.showTitle = true,
      required this.counterTag,
      this.onTap,
      required this.color,
      required this.points});

  final Color color;
  final double points;
  final bool showTitle;
  final CounterTag counterTag;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final isActive = useState(!showTitle);

    return GestureDetector(
      onTap: () {
        isActive.value = true;
        debugPrint('onTap triggered on badge');
        if (showTitle) {
          showDialog(
            useSafeArea: true,
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p8, vertical: Sizes.p48),
              child: CounterTagCard(
                counterTag: counterTag,
                points: points,
                color: color,
              ),
            ),
          );
        }
      },
      child: Stack(
        children: [
          StarContainer(
            color: isActive.value
                ? color
                : Theme.of(context).colorScheme.surfaceTint,
            pointRounding: 0.7,
            innerRadiusRatio: 0.4,
            valleyRounding: 0.3,
            squash: 0.9,
            points: points,
            child: isActive.value
                ? SvgPicture.asset(placeholder)
                : NeuText(
                    text: '?',
                    fontSize: Sizes.p64,
                    color: Theme.of(context).colorScheme.background,
                  )
                    .animate(
                      delay: 1.seconds,
                      onComplete: (controller) =>
                          controller.repeat(reverse: true),
                    )
                    .rotate(
                        begin: -0.01,
                        end: 0.01,
                        curve: const ElasticInOutCurve(),
                        duration: 800.ms)
                    .scaleXY(begin: 1.2, end: 1.9, duration: 800.ms)
                    .then()
                    .rotate(
                      begin: -0.08,
                      end: 0.08,
                      curve: const ElasticInOutCurve(),
                    ),
          )
              .animate()
              .scaleXY(
                  begin: 0.3,
                  end: 1,
                  curve: Curves.bounceInOut,
                  duration: 500.ms)
              .animate(
                autoPlay: isActive.value,
                // delay: 1.seconds,
                onComplete: (controller) => controller.repeat(),
              )
              .shimmer(duration: 1.7.seconds, delay: 1.3.seconds)
              .then(delay: 2.5.seconds),
          if (isActive.value && showTitle)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: NeuCard(
                paddingData: const EdgeInsets.all(Sizes.p4),
                cardColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Sizes.p8),
                child: Center(
                  child: Text(counterTag.name),
                ),
              )
                  .animate(
                    autoPlay: isActive.value,
                    // delay: 1.seconds,
                    onComplete: (controller) => controller.repeat(),
                  )
                  .shimmer(duration: 1.7.seconds, delay: 1.3.seconds)
                  .then(delay: 2.5.seconds),
            )
        ],
      ),
    );
  }
}
