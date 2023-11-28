import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class PlayedIdeasService extends StateNotifier<List<Idea>> {
  PlayedIdeasService() : super([]);

  void addIdea(Idea idea) {
    if (!state.contains(idea)) {
      state = [...state, idea];
    }
  }

  void deleteIdea(Idea idea) {
    state = state.where((element) => element.id != idea.id).toList();
  }

  void clear() {
    state = [];
  }
}

final playedIdeasServiceProvider =
    StateNotifierProvider<PlayedIdeasService, List<Idea>>((ref) {
  return PlayedIdeasService();
});
