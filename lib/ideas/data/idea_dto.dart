import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/data_urls.dart';
import 'package:kretatac/commons/utils/csv_parser.dart';
import 'package:kretatac/ideas/domain/idea.dart';

class IdeaDTO extends Notifier<List<Idea>> {
  IdeaDTO(this.path);

  final String path;

  @override
  List<Idea> build() => [];

  Future<void> getIdeas() async {
    debugPrint('IdeaDTO initialized');
    final csv = await _getCsv(path);

    List<Idea> ideas = [];

    for (final row in csv) {
      ideas.add(Idea.fromCsvRow(row));
    }
    // debugPrint("Ideas list is  ${ideas.length.toString()}");
    state = ideas;
    print(state.length);
  }

  Future<List<Map<String, dynamic>>> _getCsv(String path) async {
    return await CSVParser(path: path, type: NetworkData.ideas)
        .getMapFromList();
  }
}

final ideaDTOProvider = NotifierProvider<IdeaDTO, List<Idea>>(
    () => IdeaDTO('assets/data/ideas.csv'));
