import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/game/application/persuasion_service.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class PlayButton extends HookConsumerWidget {
  const PlayButton(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.text,
      required this.icon,
      required this.width,
      required this.enableAnimation});

  final Future<Null> Function()? onPressed;
  final Color color;
  final Widget text;
  final IconData icon;
  final bool enableAnimation;

  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConvinced =
        ref.watch(persuasionServiceProvider.notifier).isConvinced;

    final double height = 60;

    return AnimatedSwitcher(
      // layoutBuilder: (currentChild, previousChildren) => ,
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          alignment: Alignment.centerLeft,
          scale: animation,
          child: child,
        ),
      ),
      child: isConvinced
          ? NeuIconButton(
              buttonHeight: height,
              borderRadius: BorderRadius.circular(Sizes.p12),
              enableAnimation: enableAnimation,
              icon: Icon(icon),
              onPressed: onPressed,
              buttonColor: color,
            )
          : NeuTextButton(
              buttonHeight: height,
              buttonWidth: width,
              borderRadius: BorderRadius.circular(Sizes.p12),
              enableAnimation: enableAnimation,
              text: text,
              onPressed: onPressed,
              buttonColor: color,
            ),
    );
  }
}
