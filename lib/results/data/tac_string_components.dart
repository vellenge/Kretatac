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
  "Balnéo",
  "Neuro",
  "Hypno",
  "Algo"
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
  "papouillo",
  "pneuma",
  "méta"
];
final List<String> _suffixes = [
  "praxie",
  "pathie",
  "logie",
  "urgie",
  "thérapie",
  "isme",
  "phie",
  "puncture",
  "ergie",
  "pressure",
  "sophie",
  "tonie"
];

final List<String> _adj = [
  " cyclique",
  " osmotique",
  " alignée",
  " quantique",
  " vibratoire",
  " appliquée",
  " bionique",
  " méridienne",
  " magnétique",
  " harmonique",
  " traditionnelle",
  " programmatoire"
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
