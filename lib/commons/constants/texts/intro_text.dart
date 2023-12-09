import 'package:flutter_riverpod/flutter_riverpod.dart';

const def =
    """ , ce sont les Thérapies dites Alternatives et Complémentaires.""";
const intro =
    """Sur les réseaux, celles-ci sont parfois présentées avec des arguments chocs  et très convaincants.""";

const problem = """Mais ces arguments ont une face cachée...""";

const discover =
    """Pour découvrir leurs secrets, crée ta propre TAC et apprends comment tu peux la crédibiliser pour toucher ton audience !""";

final defTextProvider = Provider<String>((ref) => def);
final introTextProvider = Provider<String>((ref) {
  return intro;
});

final problemTextProvider = Provider<String>((ref) {
  return problem;
});

final discoverTextProvider = Provider<String>((ref) {
  return discover;
});
