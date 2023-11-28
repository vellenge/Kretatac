import 'package:flutter_riverpod/flutter_riverpod.dart';

const intro = """Une TAC, c’est une Thérapie Alternative et Complémentaire.

Dans la promotion des TAC sur les réseaux, celles-ci sont parfois présentées avec des arguments chocs  et très convaincants. 

""";

const problem = """ Mais il y a un problème...
""";

const discover =
    """Pour le découvrir, crée ta propre TAC et apprends comment tu peux la crédibiliser pour toucher ton audience !

C’est par ici ! """;

final introTextProvider = Provider<String>((ref) {
  return intro;
});

final problemTextProvider = Provider<String>((ref) {
  return problem;
});

final discoverTextProvider = Provider<String>((ref) {
  return discover;
});
