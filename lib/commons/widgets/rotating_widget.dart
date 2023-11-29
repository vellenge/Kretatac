import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RotatingWidget extends HookWidget {
  const RotatingWidget(
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
            seconds: 20,
          ),
    )
      ..isCompleted
      ..repeat();

    final rotateAnim =
        Tween<double>(begin: 0, end: 12.5664).animate(controller);

    return AnimatedBuilder(
        animation: rotateAnim,
        child: child,
        builder: (context, child) => Transform.rotate(
              filterQuality: FilterQuality.medium,
              angle: rotateAnim.value,
              child: child,
            ));
  }
}
