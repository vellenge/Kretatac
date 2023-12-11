import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class PrimaryButton extends HookConsumerWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
      this.color,
      required this.child,
      required this.width,
      this.enableAnimation = true});

  final Future<void> Function()? onPressed;
  final Color? color;
  final Widget child;

  final bool? enableAnimation;

  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actualColor =
        color ?? Theme.of(context).extension<ExtendedColor>()!.accentColor;
    // const double height = 60;

    return NeuTextButton(
      // buttonHeight: height,
      buttonWidth: width,
      borderRadius: BorderRadius.circular(Sizes.p12),
      enableAnimation: enableAnimation,
      text: child,
      onPressed: onPressed,
      buttonColor: actualColor,
    );
  }
}
