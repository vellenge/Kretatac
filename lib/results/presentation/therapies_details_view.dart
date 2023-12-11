import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/match/application/match_service.dart';
import 'package:kretatac/results/presentation/controllers/tac_provider.dart';
import 'package:kretatac/therapy/presentation/therapy_card.dart';

class TherapiesDetailsView extends ConsumerWidget {
  const TherapiesDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tac = ref.watch(tacProvider);
    final ideasValue = ref.watch(matchesProvider);
    final ideas = ideasValue.sublist(0, min(15, ideasValue.length));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        // forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        //TODO improve title
        title: Text(tac.name),
      ),
      body: AnimatedGradient(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: ListView.separated(
            itemCount: ideas.length,
            separatorBuilder: (context, index) => gapH8,
            itemBuilder: (context, index) {
              final therapy = ideas[index];
              return TherapyCard(
                  therapy: therapy.therapy,
                  ideas: therapy.matchedIdeas,
                  number: index + 1);
            },
          ),
        ),
      ),
    );
  }
}
