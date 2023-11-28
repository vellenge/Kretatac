import 'package:kretatac/character/domain/character.dart';

enum Emotion { angry, doubt, happy, sadness, satisfied, surprise }

extension GetEmotion on Character {
  String getEmotionPath(Emotion emotion) {
    String path = 'assets/images/';
    String append;

    switch (emotion) {
      case Emotion.angry:
        append = 'angry.svg';
      case Emotion.doubt:
        append = 'doubt.svg';
      case Emotion.happy:
        append = 'happy.svg';
      case Emotion.sadness:
        append = 'sadness.svg';
      case Emotion.satisfied:
        append = 'satisfied.svg';
      case Emotion.surprise:
        append = 'surprise.svg';
    }

    return path + append;
  }
}
