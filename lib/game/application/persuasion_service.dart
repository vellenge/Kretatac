import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersusasionService extends Notifier<double> {
  PersusasionService();

  @override
  double build() {
    return 0.03;
  }

  void add(double points) {
    state += points;
  }

  void substract(double points) {
    state -= points;
  }

  bool get isConvinced => state >= 1;
}

final persuasionServiceProvider =
    NotifierProvider<PersusasionService, double>(PersusasionService.new);
