import 'package:hooks_riverpod/hooks_riverpod.dart';

final List<String> _prefixes = [
  "Trans",
  "Bio",
  "Kinésio",
  "Naturo",
  "Hyper",
  "Mnémo",
  "Homéo",
  "Eu",
  "Ana",
  "Cata"
];

final List<String> _cores = [
  "logo",
  "ventouso",
  "onto",
  "éthio",
  "aqua",
  "méso",
  "phyto",
  "méridio"
];
final List<String> _suffixes = [
  "praxie",
  "pathie",
  "logie",
  "urgie",
  "pathie appliquée",
  "thérapie",
];

final prefixesProvider = Provider<List<String>>((ref) {
  return _prefixes;
});
final coresProvider = Provider<List<String>>((ref) {
  return _cores;
});
final suffixesProvider = Provider<List<String>>((ref) {
  return _suffixes;
});
