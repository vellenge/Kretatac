import 'package:hooks_riverpod/hooks_riverpod.dart';

final flipControllerProvider = StateProvider<bool>((ref) {
  return false;
});

final drawFlipControllerProvider = StateProvider<bool>((ref) {
  return false;
});
