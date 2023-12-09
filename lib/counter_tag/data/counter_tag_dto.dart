import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/commons/constants/data_urls.dart';
import 'package:kretatac/commons/utils/csv_parser.dart';
import 'package:kretatac/counter_tag/domain/counter_tag.dart';
import 'package:kretatac/ideas/data/idea_repository.dart';

class CounterTagDTO extends Notifier<List<CounterTag>> {
  CounterTagDTO(this.path);

  final String path;

  @override
  List<CounterTag> build() => [];

  Future<void> getCounterTags() async {
    final ideasLibrary = ref.watch(getIdeasListProvider);
    final csv = await _getCsv(path);

    state = csv.map(
      (csvRow) {
        return CounterTag.fromCsvRow(csvRow, ideasLibrary!);
      },
    ).toList();
  }

  Future<List<Map<String, dynamic>>> _getCsv(path) async {
    return await CSVParser(path: path, type: NetworkData.counter)
        .getMapFromList();
  }
}

final counterTagDTOProvider = NotifierProvider<CounterTagDTO, List<CounterTag>>(
    () => CounterTagDTO('assets/data/countertags.csv'));
