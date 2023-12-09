import 'dart:math';

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
}
