import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/results/data/tac_string_components.dart';
import 'package:kretatac/results/domain/tac.dart';

final rand = Random();

final tacProvider = Provider<Tac>((ref) {
  final prefixes = ref.watch(prefixesProvider);
  final cores = ref.watch(coresProvider);
  final suffixes = ref.watch(suffixesProvider);
  final adj = ref.watch(adjProvider);

  final options = [
    Tac(prefixes: prefixes, cores: cores, suffixes: suffixes),
    Tac(prefixes: prefixes, cores: suffixes, suffixes: adj)
  ];

  return options[rand.nextInt(options.length)];
});
