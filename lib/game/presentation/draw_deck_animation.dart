import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/hooks/rive_animation_controller.dart';
import 'package:kretatac/commons/preload_animation.dart';
import 'package:kretatac/game/application/game_service.dart';
import 'package:rive/rive.dart';

class DrawDeckAnimation extends HookConsumerWidget {
  const DrawDeckAnimation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useRiveAnimationController(OneShotAnimation(
      'rotation',
      autoplay: false,
    ));

    final state = useState(PreloadRive(
      path: 'assets/animations/arrow.riv',
      controllers: [controller],
    ));

    void onTap() {
      debugPrint('onTap triggered');
      controller.isActive = true;
      ref.read(gameServiceProvider.notifier).switchHand();
    }

    return GestureDetector(
        onTap: onTap,
        child: ClipOval(
            clipper: OvalClipper(),
            clipBehavior: Clip.hardEdge,
            child: state.value));
  }
}

class OvalClipper extends CustomClipper<Rect> {
  OvalClipper({this.size});

  final Size? size;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * 0.95, size.height * 0.85);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
