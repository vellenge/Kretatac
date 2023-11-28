import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/content_widget.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/ideas/presentation/widgets/cost_widget.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class IdeaCard extends StatelessWidget {
  const IdeaCard({super.key, required this.idea, this.width = 70});

  final Idea idea;
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return NeuContainer(
        shadowColor: Theme.of(context).colorScheme.onBackground,
        borderColor: Theme.of(context).colorScheme.onBackground,
        offset: neuOffset,
        borderRadius: BorderRadius.circular(Sizes.p8),
        // color: Theme.of(context).cardColor,
        color: Colors.transparent,
        width: width,
        height: width * 16 / 9,
        child: Material(
          borderRadius: BorderRadius.circular(Sizes.p8),
          color: Theme.of(context).cardColor,
          child: InkWell(
            hoverColor: Theme.of(context).colorScheme.secondaryContainer,
            splashColor: Theme.of(context).colorScheme.primary,
            onTap: () {},
            child: Stack(children: [
              ContentWidget(
                title: idea.name,
                subtitle: idea.subtitle,
                description: idea.description,
                artwork: idea.artwork,
              ),
              Positioned(
                right: Sizes.p4,
                top: Sizes.p8,
                bottom: Sizes.p48,
                child: CostWidget(cost: idea.cost),
              )
            ]),
          ),
        ));
  }
}

class MyNeuContainer extends StatelessWidget {
  final Idea idea;
  final double? width;

  const MyNeuContainer({super.key, required this.idea, this.width});
  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width;
    const radius = Sizes.p8;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width ?? viewWidth * 0.95,
        height: (width ?? viewWidth) * 16 / 9,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.onBackground,
                  offset: const Offset(Sizes.p4, Sizes.p4)),
            ],
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                strokeAlign: BorderSide.strokeAlignInside,
                color: Theme.of(context).colorScheme.onBackground,
                width: 6)),
        child: Material(
          child: InkWell(
            onTap: () {},
            child: Stack(children: [
              ContentWidget(
                title: idea.name,
                subtitle: idea.subtitle,
                description: idea.description,
                artwork: idea.artwork,
              ),
              Positioned(
                right: Sizes.p4,
                top: Sizes.p8,
                // bottom: Sizes.p64,
                child: CostWidget(cost: idea.cost),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
