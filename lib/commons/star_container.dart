import 'package:flutter/material.dart';

class StarContainer extends StatelessWidget {
  const StarContainer(
      {super.key,
      this.child,
      this.height,
      this.width,
      this.points,
      this.pointRounding,
      this.valleyRounding,
      this.innerRadiusRatio,
      this.color,
      this.squash});

  final Widget? child;
  final double? height;
  final double? width;
  final double? points;
  final double? pointRounding;
  final double? innerRadiusRatio;
  final Color? color;

  final double? valleyRounding;
  final double? squash;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              offset: const Offset(4, 4),
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
          color: color ?? Theme.of(context).colorScheme.background,
          shape: StarBorder(
              innerRadiusRatio: innerRadiusRatio ?? 0.4,
              squash: squash ?? 0,
              valleyRounding: valleyRounding ?? 0,
              pointRounding: pointRounding ?? 0,
              points: points ?? 12,
              side: BorderSide(
                  width: 5,
                  color: Theme.of(context).colorScheme.onBackground))),
      child: Center(child: child),
    );
  }
}
