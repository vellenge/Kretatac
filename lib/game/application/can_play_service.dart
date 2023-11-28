import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kretatac/game/application/wallet_service.dart';

class CanPlayService extends Notifier<bool> {
  @override
  bool build() => true;

  void setFalse() {
    state = false;
  }

  void setTrue() {
    state = true;
  }
}

final canPlayServiceProvider =
    NotifierProvider<CanPlayService, bool>(CanPlayService.new);

final canPlayProvider = Provider<bool>((ref) {
  final walletValue = ref.watch(walletServiceProvider);

  return !(walletValue == 0);
});
