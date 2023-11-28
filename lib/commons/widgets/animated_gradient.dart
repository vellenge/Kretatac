import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//Original Widget from SeriForte : https://stackoverflow.com/users/13728029/seriforte
// https://stackoverflow.com/a/62371080/22135106

class AnimatedGradient extends HookWidget {
  AnimatedGradient({super.key, required this.child});

  final Widget child;

  List<Color> primaryColors = const [
    Color.fromARGB(255, 227, 172, 157),
    Color.fromARGB(255, 227, 179, 157),
    Color.fromARGB(255, 241, 209, 165),
    Color.fromARGB(255, 220, 168, 172)
  ];
  List<Color> secondaryColors = const [
    Color.fromARGB(255, 252, 174, 153),
    Color.fromARGB(255, 236, 198, 122),
    Color.fromARGB(255, 249, 214, 180),
    Color.fromARGB(255, 245, 230, 152)
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;

  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors: primaryColors,
      secondaryColors: secondaryColors,
      // duration: const Duration(seconds: 4),
      // onEnd: () {
      //   index = index + 1;
      //   // animate the color
      //   topColor.value = colorList[(index + 1) % colorList.length];
      //   bottomColor.value = colorList[index % colorList.length];

      //   //// animate the alignment
      //   // begin = alignmentList[index % alignmentList.length];
      //   // end = alignmentList[(index + 2) % alignmentList.length];
      // },
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: begin,
      //         end: end,
      //         colors: [bottomColor.value, topColor.value])),

      child: child,
    );
  }
}
