import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/star_container.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class EvilWidget extends StatelessWidget {
  const EvilWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Sizes.p24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          NeuCard(
            paddingData: const EdgeInsets.all(Sizes.p8),
            borderRadius: BorderRadius.circular(Sizes.p12),
            cardColor: Theme.of(context).extension<ExtendedColor>()!.yellow,
            child: DropCapText(
              "On t'a fait utiliser les arguments les plus fourbes pour vendre ta technique... Tu sais maintenant les reconnaître, mais comment les contrer ?",
              dropCap: DropCap(
                width: Sizes.p64 * 1.2,
                height: Sizes.p64 * 0.9,
                child: const SizedBox(width: Sizes.p64 * 1.7),
              ),
              dropCapPosition: DropCapPosition.end,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: -Sizes.p64 / 1.7,
            right: -Sizes.p24 * 1.1,
            child: StarContainer(
                width: Sizes.p64 * 1.8,
                points: 8,
                innerRadiusRatio: 0.6,
                pointRounding: 0.7,
                height: Sizes.p64 * 2,
                child: SizedBox(
                    height: Sizes.p64,
                    child: SvgPicture.asset('assets/images/evil.svg')
                        .animate(
                          onComplete: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .then(delay: 500.ms)
                        .scaleXY(
                            begin: 0.95, end: 1, curve: Curves.bounceInOut))),
          ),
        ],
      ),
    );
  }
}
