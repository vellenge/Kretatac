import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/therapy/domain/therapy.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class CounterTag {
  CounterTag({
    required this.name,
    required this.description,
    required this.ideas,
    required this.iconPath,
  }) : id = uuid.v4();

  final String name;
  final String description;
  final List<Idea> ideas;
  final String id;
  final String iconPath;

  factory CounterTag.fromCsvRow(
      Map<String, dynamic> csvRow, List<Idea> ideaLibrary) {
    final name = csvRow["CONTRETAG"]?.toString() as String;
    final description = csvRow["description"]?.toString() as String;
    final ideas = getIdeasFromCsvMapEntry(
        (csvRow["ideas"] as String).split(','), ideaLibrary);

    //TODO handle empty case
    final iconPath = csvRow['icon'] ?? 'assets/images/refresh.svg';

    return CounterTag(
        name: name, description: description, ideas: ideas, iconPath: iconPath);
  }
}
