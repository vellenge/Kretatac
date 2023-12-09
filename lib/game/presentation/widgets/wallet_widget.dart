import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';
import 'package:kretatac/game/application/can_play_service.dart';
import 'package:kretatac/game/application/wallet_service.dart';
import 'package:kretatac/ideas/presentation/widgets/cost_widget.dart';

class WalletWidget extends HookConsumerWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletValue = ref.watch(walletServiceProvider);
    final isEmpty = ref.watch(canPlayProvider);
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 500));

    ref.listen(
      walletLimiterProvider,
      (previous, next) {
        if (next) {
          controller.forward();
        }
      },
    );

    final Color beginColor = Theme.of(context).colorScheme.surface;
    final Color endColor =
        Theme.of(context).extension<ExtendedColor>()!.accentColor;
    final colorAnim =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
    return AnimatedBuilder(
      animation: colorAnim,
      builder: (context, child) => CostWidget(
        sizeFactor: 0.8,
        height: 70,
        width: 70,
        sides: 8,
        color: isEmpty ? colorAnim.value : endColor,
        cost: walletValue,
      )
          .animate(
            controller: controller,
            onComplete: (controller) => controller.reset(),
          )
          .shake(offset: const Offset(Sizes.p4, Sizes.p4)),
    );
  }
}
