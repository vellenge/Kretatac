import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/application/deck_service.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';

import 'package:kretatac/ideas/domain/idea.dart';

class HandService extends Notifier<List<Idea?>> {
  HandService();

  @override
  List<Idea> build() {
    // final deck = ref.read(deckServiceProvider);
    // return deck.sublist(0, min(deck.length, 5));
    return [];
  }

  get played => ref.read(playedIdeasServiceProvider);

  void getHand() {
    List<Idea> hand = [];
    for (var i = 0; i < 5; i++) {
      final newCard = _getNewCard();
      if (newCard != null) {
        hand.add(newCard);
      }
    }
    state = hand;
    print("hand is $state");
  }

  void setHand(List<Idea?> newIdeas) {
    newIdeas.removeWhere((e) => e == null);
    state = newIdeas;
  }

  void draw() {
    final newCard = _getNewCard();
    if (newCard != null) {
      state = [newCard, ...state];
    }
  }

  void addIdea(Idea? idea) {
    state = [idea, ...state];
  }

  void play(Idea idea) {
    state = state.where((element) => element!.id != idea.id).toList();
  }

  Idea? _getNewCard() {
    // final played = ref.watch(playedIdeasServiceProvider);
    // final deck = ref.read(deckRepositoryProvider).getDeck();
    // return deck.firstWhere(
    //     (element) => !state.contains(element) && !played.contains(element));
    return ref.read(deckServiceProvider.notifier).drawCard();
  }
}

final handServiceNotifierProvider =
    NotifierProvider<HandService, List<Idea?>>(HandService.new);
