import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/main.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class IdeaTag extends StatelessWidget {
  const IdeaTag({super.key, required this.idea, this.isActive = true});

  final Idea idea;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return NeuCard(
      borderRadius: BorderRadius.circular(Sizes.p8),
      cardColor: isActive
          ? Theme.of(context).extension<ExtendedColor>()!.yellow
          : Colors.grey,
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
