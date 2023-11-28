import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';

RiveAnimationController useRiveAnimationController(
    RiveAnimationController controller) {
  return use(RiveAnimationHook(controller: controller));
}

class RiveAnimationHook extends Hook<RiveAnimationController> {
  const RiveAnimationHook({required this.controller});

  final RiveAnimationController controller;

  @override
  HookState<RiveAnimationController, Hook<RiveAnimationController>>
      createState() {
    return RiveAnimationHookState();
  }
}

class RiveAnimationHookState
    extends HookState<RiveAnimationController, RiveAnimationHook> {
  late RiveAnimationController controller;

  @override
  void initHook() {
    controller = hook.controller;
    super.initHook();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  RiveAnimationController build(BuildContext context) {
    return controller;
  }
}
