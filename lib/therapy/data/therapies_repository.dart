import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/therapy/data/dummy_therapies.dart';
import 'package:kretatac/therapy/data/therapy_dto.dart';
import 'package:kretatac/therapy/domain/therapy.dart';

abstract class TherapiesRepository {
  List<Therapy> getTherapies();
  Future<List<Therapy>> fetchTherapies();
  Therapy? getTherapy(String id);
  Future<Therapy?> fetchTherapy(String id);
}

class FakeTherapiesRepository extends TherapiesRepository {
  FakeTherapiesRepository({required this.therapies});

  final List<Therapy> therapies;

  @override
  Future<List<Therapy>> fetchTherapies() async {
    return Future.value(therapies);
  }

  @override
  Future<Therapy?> fetchTherapy(String id) async {
    final therapies = await fetchTherapies();
    return _getTherapy(therapies, id);
  }

  @override
  List<Therapy> getTherapies() {
    return therapies;
  }

  @override
  Therapy? getTherapy(String id) {
    return _getTherapy(therapies, id);
  }

  Therapy? _getTherapy(List<Therapy> therapies, String id) {
    try {
      return therapies.firstWhere((element) => element.id == id);
    } catch (error) {
      return null;
    }
  }
}

final therapiesRepositoryProvider = Provider<TherapiesRepository>((ref) {
  final therapies = ref.watch(therapiesDTOProvider);

  return FakeTherapiesRepository(therapies: therapies);
});

final getTherapiesListProvider = Provider<List<Therapy>>((ref) {
  final repo = ref.watch(therapiesRepositoryProvider);
  return repo.getTherapies();
});

final getTherapyProvider = Provider.family<Therapy?, String>((ref, String id) {
  final repo = ref.watch(therapiesRepositoryProvider);
  return repo.getTherapy(id);
});
