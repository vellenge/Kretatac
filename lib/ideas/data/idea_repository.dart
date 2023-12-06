import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kretatac/ideas/data/idea_dto.dart';
import 'package:kretatac/ideas/domain/idea.dart';

abstract class IdeaRepository {
  List<Idea>? getIdeas();
  Future<List<Idea>> fetchIdeas();
  Idea? getIdea(String id);
}

class FakeIdeasRepository extends IdeaRepository {
  FakeIdeasRepository({required this.ideasList});

  final List<Idea> ideasList;

  @override
  List<Idea>? getIdeas() {
    // print("getIdeas in IdeasRepo are $ideasList");
    return ideasList;
  }

  @override
  Future<List<Idea>> fetchIdeas() async {
    return Future.value(ideasList);
  }

  @override
  Idea? getIdea(String id) {
    return _getIdea(ideasList, id);
  }

  Idea? _getIdea(List<Idea> ideas, String id) {
    try {
      return ideas.firstWhere(
        (element) => element.id == id,
      );
    } catch (error) {
      return null;
    }
  }
}

final ideaRepositoryProvider = Provider<IdeaRepository>((ref) {
  final ideas = ref.watch(ideaDTOProvider);
  // print("ideas in ideaRepoProvider are $ideas");
  return FakeIdeasRepository(ideasList: ideas);
});

final getIdeasListProvider = Provider<List<Idea>?>((ref) {
  final repo = ref.watch(ideaRepositoryProvider);
  // print("repo getIdeas are ${repo}");
  return repo.getIdeas();
});

final getIdeaProvider = Provider.family<Idea?, String>((ref, String id) {
  final repo = ref.watch(ideaRepositoryProvider);
  return repo.getIdea(id);
});
