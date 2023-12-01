import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/ideas/presentation/widgets/idea_tag.dart';
import 'package:kretatac/main.dart';
import 'package:kretatac/therapy/domain/therapy.dart';

class TherapyCard extends HookWidget {
//TODO refacto limiting rebuilds
//TODO enable wrapping on ideaTags to prevent overflow

  const TherapyCard({
    super.key,
    required this.therapy,
    required this.ideas,
    required this.number,
  });

  final Therapy therapy;
  final List<Idea> ideas;
  final int number;

  @override
  Widget build(BuildContext context) {
    final isPressed = useState(false);

    return InkWell(
      onTap: () => isPressed.value = !isPressed.value,
      child: RepaintBoundary(
        child: AnimatedContainer(
          curve: Curves.elasticInOut,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.p4),
              border: Border.all(
                width: Sizes.p4,
              ),
              color: Theme.of(context).colorScheme.surface,
              boxShadow: const [BoxShadow(offset: Offset(Sizes.p4, Sizes.p4))]),
          duration: const Duration(seconds: 1),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment.topCenter,
            child: Stack(children: [
              Positioned(
                left: -20,
                top: -30,
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: OverflowBox(
                      child: BadgeNumber(
                    number: number,
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: Sizes.p8, left: Sizes.p4, right: Sizes.p4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: Sizes.p48),
                      child: Row(children: [
                        Text(
                          therapy.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ]),
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing: Sizes.p8,
                          runSpacing: Sizes.p4,
                          children: [
                            ...ideas.map((e) => SizedBox(
                                  child: IdeaTag(
                                    idea: e,
                                    isActive: true,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    if (isPressed.value) ...[
                      gapH12,
                      Text(
                        therapy.description,
                        textAlign: TextAlign.start,
                      )
                    ]
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class BadgeNumber extends StatelessWidget {
  const BadgeNumber({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: ShapeDecoration(
              color: Theme.of(context).extension<ExtendedColor>()!.ctaColor,
              shape: const PolygonBorder(sides: 5, rotate: 15)),
        ),
        Positioned(
            left: 30,
            bottom: 0,
            child: Text(
              number.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
