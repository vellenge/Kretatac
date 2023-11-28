import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/results/data/tac_string_components.dart';
import 'package:kretatac/results/domain/tac.dart';

final tacProvider = Provider<Tac>((ref) {
  final prefixes = ref.watch(prefixesProvider);
  final cores = ref.watch(coresProvider);
  final suffixes = ref.watch(suffixesProvider);

  return Tac(prefixes: prefixes, cores: cores, suffixes: suffixes);
});
