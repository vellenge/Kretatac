import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/application/played_ideas_service.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/therapy/data/therapies_repository.dart';
import 'package:kretatac/therapy/domain/therapy.dart';

class MatchMaker {
  MatchMaker();

  List<MatchedTherapy> findMatchingTherapies(
      List<Idea> ideas, List<Therapy> therapies) {
    debugPrint('findMatchingTherapies triggered');
    List<MatchedTherapy> matches = [];
    for (final therapy in therapies) {
      final List<Idea> matchedIdeas = [];
      for (final idea in therapy.ideas) {
        matchedIdeas.addAll(ideas.where((e) => e.id == idea.id));
        debugPrint(' matchedIdeas are  ${matchedIdeas.toString()}');
      }
      if (matchedIdeas.isNotEmpty) {
        matches
            .add(MatchedTherapy(therapy: therapy, matchedIdeas: matchedIdeas));
      }
    }
    print(" matches length is ${matches.length}");
    return matches;
  }

  List<MatchedTherapy> orderByMatches(List<MatchedTherapy> matches) {
    final List<MatchedTherapy> ordered = List.from(matches);
    ordered.sort((a, b) => a.numMatches.compareTo(b.numMatches));
    return ordered;
  }
}

class MatchedTherapy {
  MatchedTherapy({required this.therapy, required this.matchedIdeas});

  final Therapy therapy;
  final List<Idea> matchedIdeas;

  int get numMatches => matchedIdeas.length;
}

final matchesProvider = Provider<List<MatchedTherapy>>((ref) {
  final ideas = ref.watch(playedIdeasServiceProvider);
  final therapies = ref.watch(getTherapiesListProvider);
  final matchMaker = MatchMaker();
  final matchedTherapies = matchMaker.findMatchingTherapies(ideas, therapies);
  return matchMaker.orderByMatches(matchedTherapies);
});
