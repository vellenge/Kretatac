import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/therapy/domain/therapy.dart';

extension IdeasToTherapyParser on Therapy {
  List<Idea> getIdeasFromCsvMapEntry(
      List<String> csvIdeas, List<Idea> ideaLibrary) {
    final List<Idea> result = [];

    for (final entry in csvIdeas) {
      Idea? newIdea;
      try {
        newIdea = ideaLibrary.firstWhere((i) => i.name == entry);
      } catch (e) {
        newIdea = null;
      }

      if (newIdea != null) {
        result.add(newIdea);
      }
    }

    return result;
  }
}
