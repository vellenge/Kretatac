// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/character/application/character_dialog_service.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';
import 'package:kretatac/game/application/persuasion_service.dart';

class JaugeWidget extends ConsumerWidget {
  const JaugeWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreValue = ref.watch(persuasionServiceProvider);
    final dialogValue = ref.watch(characterDialogNotifierProvider);
    debugPrint('scoreValue is $scoreValue');

    double _actualWidth = scoreValue * width;

    final Map<double, Color> colorMap = {
      0.00: Colors.red,
      0.25: Colors.amber,
      0.50: Colors.lightGreen,
      0.75: Colors.greenAccent,
      1: Theme.of(context).extension<ExtendedColor>()!.ctaColor
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
      LayoutBuilder(
        builder: (context, constraints) => Container(
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
              width: constraints.maxWidth * scoreValue,
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: Align(
            alignment: Alignment.center,
            child:
                Text(dialogValue).animate().slideX(duration: 800.milliseconds)),
      )
    ]);
  }
}
