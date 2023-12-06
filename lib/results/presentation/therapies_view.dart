import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/utils/is_vowel.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';

import 'package:kretatac/ideas/presentation/widgets/idea_card.dart';
import 'package:kretatac/ideas/presentation/widgets/recto_idea_card.dart';
import 'package:kretatac/match/application/match_service.dart';
import 'package:kretatac/results/presentation/controllers/tac_provider.dart';
import 'package:kretatac/therapy/presentation/therapy_card.dart';

class TherapiesView extends HookConsumerWidget {
  const TherapiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final played = ref.watch(playedIdeasServiceProvider);
    final tac = ref.watch(tacProvider);
    final matches = ref.read(matchesProvider);
    debugPrint(matches.length.toString());

    final isVowel = tac.name.isVowel();
    final String pronoun = isVowel ? "L'" : "La";

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
                              " $pronoun ${tac.name} a des allégations en commun avec",
                        )),
                  ),
                ),
                gapH16,
                Wrap(
                  spacing: Sizes.p8,
                  runSpacing: Sizes.p8,
                  children: played
                      .map((e) => SizedBox(
                            width: 60,
                            child: Hero(
                              tag: e.name,
                              child: Material(
                                color: Colors.transparent,
                                child: RectoIdeaWidget(
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: SizedBox(
                                          height: 500,
                                          child: MyNeuContainer(idea: e)),
                                    ),
                                  ),
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
