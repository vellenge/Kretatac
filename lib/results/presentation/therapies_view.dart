import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/ideas/data/dummy_ideas.dart';
import 'package:kretatac/ideas/presentation/widgets/recto_idea_card.dart';
import 'package:kretatac/match/application/match_service.dart';
import 'package:kretatac/results/presentation/controllers/tac_provider.dart';
import 'package:kretatac/therapy/presentation/therapy_card.dart';

class TherapiesView extends HookConsumerWidget {
  const TherapiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tac = ref.watch(tacProvider);
    final matches = ref.read(matchesProvider);
    debugPrint(matches.length.toString());

    return SafeArea(
      child: Scaffold(
        body: AnimatedGradient(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Hero(
                        tag: 'TAC',
                        child: NeuText(
                          fontSize: Sizes.p24,
                          text:
                              " La ${tac.name} a des allégations en commun avec",
                        )),
                  ),
                ),
                gapH16,
                Wrap(
                  spacing: Sizes.p4,
                  children: dummyIdeas
                      .map((e) => SizedBox(
                            width: 60,
                            child: Hero(
                              tag: e.name,
                              child: Material(
                                child: RectoIdeaWidget(
                                  idea: e,
                                  showCost: false,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                gapH32,
                Expanded(
                  child: ListView.separated(
                    itemCount: matches.length,
                    separatorBuilder: (context, index) => gapH8,
                    itemBuilder: (context, index) => TherapyCard(
                        therapy: matches[index].therapy,
                        ideas: matches[index].matchedIdeas,
                        number: index + 1),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
