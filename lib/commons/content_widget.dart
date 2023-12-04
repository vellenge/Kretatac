import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.artwork,
    required this.description,
  });

  final String title;
  final String subtitle;
  final Image? artwork;
  final String description;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(children: [
          Container(
            height: constraints.maxHeight * 0.1,
            // decoration: BoxDecoration(
            //   borderRadius: const BorderRadius.only(
            //       // topLeft: Radius.circular(Sizes.p4),
            //       // topRight: Radius.circular(Sizes.p4),
            //       ),
            // ),
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
          Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.tertiary,
              height: constraints.maxHeight * 0.25,
              child: artwork),
          gapH12,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: SizedBox(
              height: constraints.maxHeight * 0.6,
              child: Column(
                children: [
                  Text(subtitle,
                      style: Theme.of(context).textTheme.titleMedium),
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
