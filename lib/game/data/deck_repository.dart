import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/ideas/data/idea_repository.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class DeckRepository {
  DeckRepository({required this.ideas});

  final List<Idea>? ideas;

  List<Idea> getDeck() {
    final deck = ideas;
    deck!.shuffle();
    print(deck);
    return deck;
  }
}

final deckRepositoryProvider = Provider<DeckRepository>((ref) {
  final ideas = ref.watch(getIdeasListProvider);
  print(" ideas in DECKREPO are $ideas");
  return DeckRepository(ideas: ideas);
});
