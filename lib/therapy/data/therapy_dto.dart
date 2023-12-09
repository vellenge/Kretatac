import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/commons/constants/data_urls.dart';
import 'package:kretatac/commons/utils/csv_parser.dart';
import 'package:kretatac/ideas/data/idea_repository.dart';

import 'package:kretatac/therapy/domain/therapy.dart';

class TherapyDTO extends Notifier<List<Therapy>> {
  TherapyDTO(this.path);

  final String path;

  @override
  List<Therapy> build() => [];

  Future<void> getTherapies() async {
    debugPrint('IdeaDTO initialized');
    final csv = await _getCsv(path);

    List<Therapy> therapies = [];

    final ideasLibrary = ref.watch(getIdeasListProvider);

    for (final row in csv) {
      therapies.add(Therapy.fromCsvRow(row, ideasLibrary!));
    }
    debugPrint("Therapies list is  ${therapies.length.toString()}");
    state = therapies;
    debugPrint(state.map((element) => element.ideas).toString());
    debugPrint((state.length).toString());
  }

  Future<List<Map<String, dynamic>>> _getCsv(String path) async {
    return await CSVParser(path: path, type: NetworkData.therapies)
        .getMapFromList();
  }
}

final therapiesDTOProvider = NotifierProvider<TherapyDTO, List<Therapy>>(
    () => TherapyDTO('assets/data/therapies.csv'));
