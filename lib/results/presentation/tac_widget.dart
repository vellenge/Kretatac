import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/star_container.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/results/domain/tac.dart';

class TacWidget extends StatelessWidget {
  const TacWidget(
      {super.key,
      required this.tac,
      this.width = 500,
      this.isVertical = false});

  final Tac tac;
  final double width;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
          children: [
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const StarContainer(
            innerRadiusRatio: 0.9,
            valleyRounding: 0.4,
            squash: 1,
            pointRounding: 0,
            points: Sizes.p24,
            width: double.infinity,
          )
              .animate(
                onComplete: (controller) => controller.repeat(),
              )
              .rotate(
                  curve: Curves.elasticOut,
                  duration: const Duration(seconds: 3)),
        )),
        Center(
          child: Transform.rotate(
            angle: -220,
            child: Wrap(
                direction: isVertical ? Axis.vertical : Axis.horizontal,
                spacing: Sizes.p4,
                children: [
                  NeuText(
                    text: tac.prefix,
                  ),
                  NeuText(
                    text: tac.core,
                  ),
                  NeuText(
                    text: tac.suffix,
                  )
                ]
                    .animate(interval: 800.ms)
                    .fadeIn()
                    .moveY(delay: 1.seconds)
                    .scale(delay: 1.seconds)),
          ),
        ),
      ].animate(interval: 400.ms).scale()),
    );
  }
}
