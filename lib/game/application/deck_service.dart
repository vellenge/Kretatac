import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/data/deck_repository.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class DeckService extends Notifier<List<Idea>> {
  DeckService();

  @override
  List<Idea> build() {
    print("DeckService is building");
    return ref.read(deckRepositoryProvider).getDeck();
  }

  List<Idea> switchCards({required List<Idea> ideas}) {
    final quantity = min(ideas.length, 5);

    List<Idea> newIdeas = [];
    for (var i = 0; i < quantity; i++) {
      final Idea? card = drawCard();
      if (card != null) {
        newIdeas.add(card);
      }
    }

    for (final idea in ideas) {
      addCard(idea);
    }

    while (newIdeas.length < quantity) {
      final Idea? idea = drawCard();
      if (idea != null) {
        newIdeas.add(idea);
      }
    }
    return newIdeas;
  }

  void addCard(Idea idea) {
    state = [...state, idea];
  }

  Idea? drawCard() {
    final idea = state.firstOrNull;
    if (idea != null) {
      state = state.where((element) => element.id != idea.id).toList();
    }
    print(idea);
    return idea;
  }
}

final deckServiceProvider =
    NotifierProvider<DeckService, List<Idea>>(DeckService.new);
