import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useScrollAnimationController(
    AnimationController animationController) {
  return use(
      ScrollAnimationController(animationController: animationController));
}

class ScrollAnimationController extends Hook<ScrollController> {
  const ScrollAnimationController({required this.animationController});

  final AnimationController animationController;

  @override
  HookState<ScrollController, Hook<ScrollController>> createState() {
    return ScrollAnimationControllerState();
  }
}

class ScrollAnimationControllerState
    extends HookState<ScrollController, ScrollAnimationController> {
  late ScrollController _scrollController;

  @override
  void initHook() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.idle:
          hook.animationController.forward();
          hook.animationController.repeat();
        default:
          hook.animationController.forward();
          hook.animationController.repeat();
      }
    });
    super.initHook();
  }

  @override
  ScrollController build(BuildContext context) {
    return _scrollController;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

AnimationController useMyAnimationController(
    AnimationController animationController) {
  return use(MyAnimationController(animationController: animationController));
}

class MyAnimationController extends Hook<AnimationController> {
  const MyAnimationController({required this.animationController});

  final AnimationController animationController;

  @override
  HookState<AnimationController, Hook<AnimationController>> createState() {
    return MyAnimationControllerState();
  }
}

class MyAnimationControllerState
    extends HookState<AnimationController, MyAnimationController> {
  @override
  void initHook() {
    hook.animationController.repeat();

    super.initHook();
  }

  @override
  AnimationController build(BuildContext context) {
    return hook.animationController;
  }

  @override
  void dispose() {
    hook.animationController.dispose();
    super.dispose();
  }
}
