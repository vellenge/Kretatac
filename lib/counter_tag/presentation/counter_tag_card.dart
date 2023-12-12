import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/counter_tag/domain/counter_tag.dart';
import 'package:kretatac/counter_tag/presentation/counter_tag_badge.dart';

class CounterTagCard extends StatelessWidget {
  const CounterTagCard({
    super.key,
    required this.counterTag,
    required this.points,
    required this.color,
  });

  final CounterTag counterTag;
  final double points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(alignment: Alignment.center, clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.onBackground,
                      offset: const Offset(Sizes.p4, Sizes.p4)),
                ],
                // borderRadius: BorderRadius.circular(Sizes.p48),s
                border: Border.all(
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 6)),
            child: Column(
              children: [
                Container(
                  height: Sizes.p64 * 2,
                  decoration: const BoxDecoration(
                    //TODO change for actual colors
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 247, 203, 99),
                      Color.fromARGB(255, 244, 188, 66),
                      Color.fromARGB(255, 245, 208, 105),
                      Color.fromARGB(255, 245, 187, 105),
                    ]),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      counterTag.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Sizes.p8),
                  child: Text(
                    counterTag.description,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -Sizes.p64,
            width: Sizes.p64 * 2.2,
            height: Sizes.p64 * 2.2,
            child: SizedBox(
              // width: Sizes.p64 * 2,
              // height: Sizes.p64 * 2,
              child: CounterTagbadge.fixedPoints(
                color: color,
                points: points,
                showTitle: false,
                counterTag: counterTag,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
