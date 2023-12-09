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
  "Cata",
  "Phréno",
  "Physio",
  "Balnéo"
];

final List<String> _cores = [
  "logo",
  "ventouso",
  "onto",
  "éthio",
  "aqua",
  "méso",
  "phyto",
  "méridio",
  "litho",
  "sylvo",
  "papouillo"
];
final List<String> _suffixes = [
  "praxie",
  "pathie",
  "logie",
  "urgie",
  "thérapie",
  "ki",
  "isme",
  "phie",
  "cture",
  "ergie"
];

final List<String> _adj = [
  " quantique",
  " vibratoire",
  " appliquée",
  " bionique",
  " méridienne",
  " magnétique",
  " harmonique",
  " traditionnelle"
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
final adjProvider = Provider<List<String>>((ref) {
  return _adj;
});
