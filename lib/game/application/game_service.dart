import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/application/deck_service.dart';
import 'package:kretatac/game/application/hand_service.dart';
import 'package:kretatac/game/application/persuasion_service.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';
import 'package:kretatac/game/application/wallet_service.dart';
import 'package:kretatac/game/presentation/controllers/flip_controller.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class GameService extends Notifier<void> {
  GameService();

  @override
  void build() {
    // ref.watch(playedIdeasServiceProvider);
    // ref.watch(handServiceNotifierProvider);
  }

  Future<void> playCard(Idea idea) async {
    final walletValue = ref.read(walletServiceProvider);

    if (walletValue >= idea.cost) {
      ref.read(handServiceNotifierProvider.notifier).play(idea);
      ref.read(playedIdeasServiceProvider.notifier).addIdea(idea);
      ref.read(walletServiceProvider.notifier).substract(idea.cost);
      ref.read(persuasionServiceProvider.notifier).add(idea.persuasion);
      await Future.delayed(const Duration(milliseconds: 1000));

      ref.read(handServiceNotifierProvider.notifier).draw();
      ref.read(drawFlipControllerProvider.notifier).state = true;
      ref.read(drawFlipControllerProvider.notifier).state = false;
    } else {
      ref.read(walletLimiterProvider.notifier).setTrue();
    }
  }

  void retrieveIdeaFromTableToHand(Idea idea) {
    ref.read(handServiceNotifierProvider.notifier).addIdea(idea);
    ref.read(playedIdeasServiceProvider.notifier).deleteIdea(idea);
    ref.read(walletServiceProvider.notifier).add(idea.cost);
    ref.read(persuasionServiceProvider.notifier).substract(idea.persuasion);
    ref.read(drawFlipControllerProvider.notifier).state = true;
    ref.read(drawFlipControllerProvider.notifier).state = false;
  }

  void switchHand() {
    final oldCards = [...ref.read(handServiceNotifierProvider).nonNulls];

    if (oldCards.isNotEmpty) {
      final newIdeas =
          ref.read(deckServiceProvider.notifier).switchCards(ideas: oldCards);
      ref.read(flipControllerProvider.notifier).state = true;
      ref.read(handServiceNotifierProvider.notifier).setHand(newIdeas);
    }
  }
}

final gameServiceProvider =
    NotifierProvider<GameService, void>(GameService.new);
