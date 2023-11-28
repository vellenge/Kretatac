import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/commons/widgets/animated_gradient.dart';
import 'package:kretatac/commons/widgets/neu_text.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';

import 'package:kretatac/ideas/presentation/widgets/recto_idea_card.dart';
import 'package:kretatac/results/presentation/controllers/tac_provider.dart';
import 'package:kretatac/results/presentation/tac_widget.dart';
import 'package:kretatac/results/presentation/therapies_view.dart';

import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class TacView extends HookConsumerWidget {
  const TacView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tac = ref.watch(tacProvider);
    final playedIdeas = ref.watch(playedIdeasServiceProvider);

    final width = MediaQuery.of(context).size.width;
    final controller = useAnimationController()
      ..duration = const Duration(seconds: 2);
    useState(Timer(const Duration(seconds: 3), () {
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => const TherapiesView()));
    }));

    return SafeArea(
      child: Scaffold(
        body: AnimatedGradient(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p24),
            child: Column(children: [
              gapH48,
              NeuText(
                color: Theme.of(context).colorScheme.surface,
                text: 'Bravo, tu viens de promouvoir la',
                fontSize: Sizes.p24,
              ),
              gapH12,
              SizedBox(
                height: 250,
                child: Hero(
                  createRectTween: (begin, end) {
                    return Tween(begin: begin, end: end)..animate(controller);
                  },
                  tag: 'TAC',
                  child: TacWidget(
                    tac: tac,
                    isVertical: true,
                  ),
                ),
              ),
              gapH16,
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: Sizes.p12,
                      mainAxisSpacing: Sizes.p12,
                      childAspectRatio: 9 / 12,
                      maxCrossAxisExtent: width / 4),
                  children: [
                    ...playedIdeas.map((e) => Hero(
                          tag: e.name,
                          child: SizedBox(
                            height: 150,
                            child: RectoIdeaWidget(showCost: false, idea: e),
                          ),
                        ))
                  ].animate(delay: 3.seconds, interval: 400.ms).flipH(),
                ),
              ),
              NeuIconButton(
                enableAnimation: true,
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TherapiesView())),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
