import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';

import 'package:kretatac/commons/utils/is_vowel.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/commons/widgets/primary_button.dart';
import 'package:kretatac/counter_tag/data/counter_tag_repository.dart';
import 'package:kretatac/counter_tag/presentation/counter_tag_button.dart';
import 'package:kretatac/counter_tag/presentation/counter_tag_card.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';
import 'package:kretatac/ideas/domain/idea.dart';

import 'package:kretatac/ideas/presentation/widgets/idea_card.dart';
import 'package:kretatac/ideas/presentation/widgets/recto_idea_card.dart';
import 'package:kretatac/match/application/match_service.dart';
import 'package:kretatac/results/domain/tac.dart';

import 'package:kretatac/results/presentation/controllers/tac_provider.dart';
import 'package:kretatac/results/presentation/evil_widget.dart';
import 'package:kretatac/results/presentation/therapies_details_view.dart';
import 'package:kretatac/therapy/presentation/therapy_card.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

void showIdeaDialog(Idea idea, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: SizedBox(height: 500, child: MyNeuContainer(idea: idea)),
    ),
  );
}

class TherapiesView extends HookConsumerWidget {
  const TherapiesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final played = ref.watch(playedIdeasServiceProvider);
    final tac = ref.watch(tacProvider);
    final matches = ref.read(matchesProvider);
    final counterTags = ref.watch(getCounterTagsListProvider);
    debugPrint(matches.length.toString());

    final height = MediaQuery.of(context).size.height;

    final shadowColor = Theme.of(context).colorScheme.onBackground;

    final isVowel = tac.name.isVowel();
    final String pronoun = isVowel ? "L'" : "La";

    final controller = useScrollController(initialScrollOffset: 0.0);

    return SafeArea(
      child: Scaffold(
        body: AnimatedGradient(
          child: CustomScrollView(
            controller: controller,
            slivers: [
              TacResultsAppBar(
                  played: played,
                  shadowColor: shadowColor,
                  pronoun: pronoun,
                  tac: tac),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      gapH4,
                      Text("Ta TAC a des allégations en commun avec",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      gapH12,
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                sliver: SliverList.separated(
                  itemCount: min(matches.length, 5),
                  separatorBuilder: (context, index) => gapH8,
                  itemBuilder: (context, index) => TherapyCard(
                      therapy: matches[index].therapy,
                      ideas: matches[index].matchedIdeas,
                      number: index + 1),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      if (matches.length > 5) ...[
                        gapH16,
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Sizes.p24),
                          child: PrimaryButton(
                            onPressed: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const TherapiesDetailsView();
                              },
                            )),
                            width: double.infinity,
                            child: Text(
                              "+ ${min(matches.length, 15) - 5} techniques",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                      gapH48,
                      const EvilWidget(),
                      gapH12,
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(Sizes.p8),
                sliver: SliverGrid.builder(
                    itemCount: min(matches.length, 5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: Sizes.p16,
                            crossAxisSpacing: Sizes.p16,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => CounterTagButton(
                          counterTag: counterTags[index],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TacResultsAppBar extends StatelessWidget {
  const TacResultsAppBar({
    super.key,
    required this.played,
    required this.shadowColor,
    required this.pronoun,
    required this.tac,
  });

  final List<Idea> played;
  final Color shadowColor;
  final String pronoun;
  final Tac tac;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, constraints) {
      final appBarColor = constraints.scrollOffset < 10
          ? Colors.transparent
          : Theme.of(context).colorScheme.surfaceTint;
      return SliverAppBar(
        pinned: true,
        backgroundColor: appBarColor,

        automaticallyImplyLeading: false,

        //Todo set the height dynamically
        expandedHeight: 40 * 2 + Sizes.p8 + 60 + 40,

        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Wrap(
                alignment: WrapAlignment.center,
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
                                offset: Offset.zero,
                                onPressed: () => showIdeaDialog(e, context),
                                idea: e,
                                showCost: false,
                              ),
                            ),
                          ),
                        ))
                    .toList()
                    .animate(
                      interval: 250.milliseconds,
                      onComplete: (controller) =>
                          controller.repeat(reverse: true),
                    )
                    .boxShadow(
                        borderRadius: BorderRadius.circular(Sizes.p4),
                        curve: Curves.elasticInOut,
                        duration: 1.seconds,
                        delay: 1.2.seconds,
                        begin: BoxShadow(
                            color: shadowColor, offset: const Offset(0, 0)),
                        end: BoxShadow(
                            color: shadowColor, offset: const Offset(4, 4))),
              ),
            ],
          ),
        ),

        title: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 80,
          child: Center(
            child: Hero(
                tag: 'TAC',
                child: NeuText(
                  fontSize: Sizes.p24,
                  text: " $pronoun ${tac.name} ",
                )),
          ),
        ),
      );
    });
  }
}
