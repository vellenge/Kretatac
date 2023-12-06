import 'dart:math';

import 'package:flutter/widgets.dart';

final Random rand = Random();

String getRandom(List<String> list) {
  return list[rand.nextInt(list.length)];
}

final List<String> voyels = ["a", "e", "i", "o", "u"];

class Tac {
  Tac({
    required this.prefixes,
    required this.cores,
    required this.suffixes,
  })  : prefix = getRandom(prefixes),
        core = getRandom(cores),
        suffix = getRandom(suffixes);

  final List<String> prefixes;
  final List<String> cores;
  final List<String> suffixes;

  final String prefix;
  final String core;
  final String suffix;

  String get name => prefix + core + suffix;

//TODO refacto eraseDoubleLetters
  String eraseDoubleLetters(String string) {
    String newStr = "";

    for (final char in string.characters) {
      int length = newStr.length;
      if (!voyels.contains(char.toLowerCase()) &&
          char == (length > 0 ? newStr[length - 1] : "@")) {
      } else {
        newStr = newStr + char;
      }
    }
    return newStr;
  }
}
