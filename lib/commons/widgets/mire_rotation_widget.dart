import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kretatac/commons/widgets/rotating_widget.dart';

class MireRotationWidget extends StatelessWidget {
  const MireRotationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatingWidget(
      duration: const Duration(seconds: 20),
      child: Container(
        child: SvgPicture.asset(
          'assets/images/mire.svg',
          allowDrawingOutsideViewBox: true,
          colorFilter:
              const ColorFilter.mode(Colors.transparent, BlendMode.darken),
          fit: BoxFit.none,
        )
            .animate(
              onComplete: (controller) => controller.reverse(),
            )
            .scaleXY(
                begin: 2.8, end: 4.6, duration: const Duration(seconds: 1)),
      ),
    );
  }
}
