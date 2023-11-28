import 'package:kretatac/ideas/domain/idea.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Therapy {
  Therapy({
    required this.name,
    required this.description,
    required this.ideas,
  }) : id = uuid.v4();

  final String name;
  final String description;
  final List<Idea> ideas;
  final String id;

  Therapy.fromCsvRow(Map<String, dynamic> csv, List<Idea> ideasLibrary)
      : name = csv["name"] as String,
        description = csv["description"] as String,
        ideas = getIdeasFromCsvMapEntry(
            (csv["ideas"] as String).split(','), ideasLibrary),
        id = uuid.v4();

  bool isMatchingWithIdea(Idea idea) {
    return ideas.contains(idea);
  }
}

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
