import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/game/application/persuasion_service.dart';

class JaugeWidget extends ConsumerWidget {
  const JaugeWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreValue = ref.watch(persuasionServiceProvider);
    debugPrint('scoreValue is $scoreValue');

    double _actualWidth = scoreValue * width;

    final Map<double, Color> colorMap = {
      0.00: Colors.red,
      0.25: Colors.amber,
      0.50: Colors.lightGreen,
      0.75: Colors.greenAccent
    };

    Color _getColor(double percent) {
      Color color = Colors.red;

      for (MapEntry<double, Color> entry in colorMap.entries) {
        if (entry.key < percent) {
          color = entry.value;
        }
      }
      return color;
    }

    final Color actualColor = _getColor(scoreValue);

    return Stack(children: [
      Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(Sizes.p12),
            border: Border.all(
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 8,
                color: Theme.of(context).colorScheme.onBackground),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.onBackground,
                  offset: const Offset(Sizes.p4, Sizes.p4))
            ]),
        alignment: Alignment.centerLeft,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.p4),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
            color: actualColor,
            transformAlignment: Alignment.centerLeft,
            width: _actualWidth,
          ),
        ),
      ),
      Positioned.fill(
        child: Align(
            alignment: Alignment.center,
            child: const Text('JPP est convaincu !').animate().slideY()),
      )
    ]);
  }
}
