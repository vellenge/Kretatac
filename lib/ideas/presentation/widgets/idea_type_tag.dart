import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class IdeaTypeTagWidget extends StatelessWidget {
  const IdeaTypeTagWidget({
    super.key,
    required this.idea,
  });

  final Idea idea;

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      cardColor: idea.enumType.color,
      paddingData:
          const EdgeInsets.symmetric(horizontal: Sizes.p12, vertical: Sizes.p4),
      borderRadius: BorderRadius.circular(Sizes.p12),
      child: Text(idea.enumType.type,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.background)),
    );
  }
}
