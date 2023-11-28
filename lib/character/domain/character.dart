import 'package:kretatac/character/domain/emotions.dart';

class Character {
  Character({this.emotion = Emotion.sadness});

  final Emotion emotion;

  String getPath() {
    return getEmotionPath(emotion);
  }
}
