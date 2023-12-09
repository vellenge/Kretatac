import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/counter_tag/data/counter_tag_dto.dart';
import 'package:kretatac/counter_tag/domain/counter_tag.dart';

class CounterTagRepository {
  CounterTagRepository({required this.counterTags});

  final List<CounterTag> counterTags;

  List<CounterTag> getCounterTags() {
    return counterTags;
  }
}

final counterTagRepositoryProvider = Provider<CounterTagRepository>((ref) {
  final counterTags = ref.watch(counterTagDTOProvider);

  return CounterTagRepository(counterTags: counterTags);
});

final getCounterTagsListProvider = Provider<List<CounterTag>>((ref) {
  final repo = ref.watch(counterTagRepositoryProvider);

  return repo.getCounterTags();
});
