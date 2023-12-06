import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//Original Widget from SeriForte : https://stackoverflow.com/users/13728029/seriforte
// https://stackoverflow.com/a/62371080/22135106
//Modified to use flutter hooks

class AnimatedGradient extends HookWidget {
  AnimatedGradient({super.key, required this.child, this.runAnimation = false});

  final bool runAnimation;

  final Widget child;

  final List<Color> primaryColors = const [
    Color.fromARGB(255, 227, 172, 157),
    Color.fromARGB(255, 227, 179, 157),
    Color.fromARGB(255, 241, 209, 165),
    Color.fromARGB(255, 220, 168, 172)
  ];
  final List<Color> secondaryColors = const [
    Color.fromARGB(255, 252, 174, 153),
    Color.fromARGB(255, 236, 198, 122),
    Color.fromARGB(255, 249, 214, 180),
    Color.fromARGB(255, 245, 230, 152)
  ];
  final List<Alignment> alignmentList = [
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
    return runAnimation
        ? RepaintBoundary(
            child: AnimateGradient(
              primaryColors: primaryColors,
              secondaryColors: secondaryColors,
              child: child,
            ),
          )
        : Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 227, 172, 157),
                  Color.fromARGB(255, 227, 179, 157),
                  Color.fromARGB(255, 241, 209, 165),
                  Color.fromARGB(255, 221, 186, 189)
                ])),
            child: child);
  }
}
