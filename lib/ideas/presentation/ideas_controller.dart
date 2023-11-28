import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class IdeaController extends StateNotifier<List<Idea>> {
  IdeaController() : super([]);

  addIdea(Idea idea) {
    if (!state.contains(idea)) {
      state = [...state, idea];
    }
  }

  deleteidea(Idea idea) {
    state = state.where((e) => e.id != idea.id).toList();
  }

  clear() {
    state = [];
  }
}

final ideaControllerProvider =
    StateNotifierProvider<StateNotifier<List<Idea>>, List<Idea>>((ref) {
  return IdeaController();
});
