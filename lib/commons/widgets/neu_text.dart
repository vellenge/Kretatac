import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';

class NeuText extends StatelessWidget {
  const NeuText({super.key, required this.text, this.fontSize, this.color});

  final String text;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color shadow = Theme.of(context).colorScheme.onBackground;
    final double offSize = fontSize != null ? fontSize! / 3.5 : Sizes.p16;

    return Stack(children: [
      Text(text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: fontSize,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = offSize
                  ..strokeMiterLimit = 6
                  ..strokeCap = StrokeCap.butt
                  ..strokeJoin = StrokeJoin.miter
                  ..color = shadow,
              )),
      Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontSize: fontSize,
            color: color ??
                Theme.of(context).extension<ExtendedColor>()!.accentColor),
      )
    ]);
  }
}
