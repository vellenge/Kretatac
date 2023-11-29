import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScaleWidget extends HookWidget {
  const ScaleWidget(
      {super.key,
      this.scaleDown,
      required this.child,
      this.duration,
      this.isActive = true});

  final Widget child;
  final Duration? duration;
  final double? scaleDown;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: duration ??
            const Duration(
              seconds: 1,
            ),
        initialValue: 0,
        lowerBound: 0,
        upperBound: 1)
      ..repeat(reverse: true);

    final scaleAnim =
        Tween<double>(begin: scaleDown ?? 0.96, end: 0.99).animate(controller);

    return AnimatedBuilder(
        animation: scaleAnim,
        child: child,
        builder: (context, child) => Transform.scale(
              filterQuality: FilterQuality.low,
              scale: isActive ? scaleAnim.value : 1,
              child: child,
            ));
  }
}
