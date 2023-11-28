import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletService extends Notifier<int> {
  @override
  build() {
    return 20;
  }

  void substract(int cost) {
    state - cost >= 0 ? state = state - cost : null;
    // : ref.read(walletLimiterProvider.notifier).setTrue();
  }

  void add(int cost) {
    state = state + cost;
    if (state > 20) {
      state = 20;
    }
  }
}

final walletServiceProvider =
    NotifierProvider<WalletService, int>(WalletService.new);

class WalletLimiter extends Notifier<bool> {
  @override
  bool build() => false;

  void setTrue() {
    state = !state;
    // await Future.delayed(const Duration(milliseconds: 200));
    state = !state;
  }
}

final walletLimiterProvider =
    NotifierProvider<WalletLimiter, bool>(WalletLimiter.new);
