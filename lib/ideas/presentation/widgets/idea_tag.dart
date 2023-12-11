import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/domain/idea.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class IdeaTag extends StatelessWidget {
  const IdeaTag({super.key, required this.idea, this.isActive = true});

  IdeaTag.argument({super.key, this.isActive = true})
      : idea = Idea(
            name: 'Arguments',
            cost: 0,
            description: "description",
            subtitle: "subtitle",
            persuasion: 0,
            typeString: "arg");
  IdeaTag.attribut({super.key, this.isActive = true})
      : idea = Idea(
            name: 'Attributs',
            cost: 0,
            description: "description",
            subtitle: "subtitle",
            persuasion: 0,
            typeString: "car");
  final Idea idea;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      offset: const Offset(2, 2),
      borderRadius: BorderRadius.circular(Sizes.p8),
      cardColor: isActive ? idea.enumType.color : Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          idea.name,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: isActive ? null : Colors.grey[700]),
        ),
      ),
    );
  }
}
