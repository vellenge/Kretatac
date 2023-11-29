import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class BouncingWidget extends HookWidget {
  const BouncingWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (context, child) {
        return Transform.translate(
          filterQuality: FilterQuality.medium,
          offset: Offset(0, controller.value * 10),
          child: child,
        );
      },
    );
  }
}
