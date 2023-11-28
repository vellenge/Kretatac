import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/character/application/character_emotion_service.dart';
import 'package:kretatac/character/domain/character.dart';

class CharacterWidget extends ConsumerWidget {
  const CharacterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emotion = ref.watch(emotionServiceProvider);
    final character = Character(emotion: emotion);

    return SvgPicture.asset(character.getPath());
  }
}
