import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<String> _prefixes = ["Trans", "Bio", "Kinésio", "Naturo"];

final List<String> _cores = ["logo", "ventouso", "onto", "éthio"];
final List<String> _suffixes = ["praxie", "pathie", "logie", "urgie"];

final prefixesProvider = Provider<List<String>>((ref) {
  return _prefixes;
});
final coresProvider = Provider<List<String>>((ref) {
  return _cores;
});
final suffixesProvider = Provider<List<String>>((ref) {
  return _suffixes;
});
