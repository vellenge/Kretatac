import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:kretatac/character/domain/emotions.dart';
import 'package:kretatac/game/application/persuasion_service.dart';

class CharacterEmotionService extends Notifier<Emotion> {
  @override
  Emotion build() {
    final persuasionScore = ref.watch(persuasionServiceProvider);
    return _switcher(persuasionScore);
  }

  Emotion _switcher(double score) {
    Emotion emotion = Emotion.sadness;

    for (MapEntry<double, Emotion> entry in emotionMap.entries) {
      if (entry.key < score) {
        emotion = entry.value;
      }
    }
    return emotion;
  }

  final Map<double, Emotion> emotionMap = {
    0.00: Emotion.sadness,
    0.25: Emotion.angry,
    0.50: Emotion.doubt,
    0.75: Emotion.surprise,
    1.0: Emotion.satisfied
  };
}

final emotionServiceProvider =
    NotifierProvider<CharacterEmotionService, Emotion>(
        CharacterEmotionService.new);
