import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

CarouselController useCarouselController() {
  return use(CarouselControllerHook());
}

class CarouselControllerHook extends Hook<CarouselController> {
  @override
  HookState<CarouselController, Hook<CarouselController>> createState() {
    return CarouselControllerHookState();
  }
}

class CarouselControllerHookState
    extends HookState<CarouselController, CarouselControllerHook> {
  late CarouselController _carouselController;

  @override
  void initHook() {
    _carouselController = CarouselController();
    super.initHook();
  }

  @override
  CarouselController build(BuildContext context) {
    return _carouselController;
  }

  @override
  void dispose() {
    // _carouselController.dispose();
    super.dispose();
  }
}
