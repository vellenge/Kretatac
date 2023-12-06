import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/presentation/widgets/idea_type_tag.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.artwork,
    this.tag,
    required this.description,
  });

  final String title;
  final String subtitle;
  final Image? artwork;
  final String description;
  final IdeaTypeTagWidget? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(children: [
          Container(
            height: constraints.maxHeight * 0.1,
            color: Theme.of(context).colorScheme.onBackground,
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
          ),
          Stack(clipBehavior: Clip.none, children: [
            Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.tertiary,
              height: constraints.maxHeight * 0.25,
              child: artwork,
            ),
            if (tag != null)
              Positioned(
                bottom: -4,
                right: -5,
                child: tag!,
              ),
          ]),
          gapH12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: SizedBox(
              height: constraints.maxHeight * 0.6,
              child: Column(
                children: [
                  Text(subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  gapH8,
                  Expanded(
                      child: ListView(children: [
                    Text(textAlign: TextAlign.justify, description)
                  ])),
                ],
              ),
            ),
          )
        ]);
      },
    );
  }
}
