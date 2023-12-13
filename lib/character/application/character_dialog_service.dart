import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/application/persuasion_service.dart';

class CharacterDialogNotifier extends Notifier<String> {
  @override
  build() {
    final persuasionScore = ref.watch(persuasionServiceProvider);
    return _switcher(persuasionScore);
  }

  String _switcher(double score) {
    String dialog = dialogMap.entries.first.value;

    for (MapEntry<double, String> entry in dialogMap.entries) {
      if (entry.key < score) {
        dialog = entry.value;
      }
    }
    return dialog;
  }

  final Map<double, String> dialogMap = {
    0.00: "J'ai besoin d'une solution...",
    0.1: "Je n'en vois pas le bout :(",
    0.25: "Il m'en faut plus que ça",
    0.4: "Hmmm, mais encore ?",
    0.75: "Ok, ça a l'air pas mal ton truc",
    0.85: "Impressionnant, je commence à y croire",
    1.0: "Waouh, je suis convaincu !"
  };
}

final characterDialogNotifierProvider =
    NotifierProvider<CharacterDialogNotifier, String>(
        CharacterDialogNotifier.new);
