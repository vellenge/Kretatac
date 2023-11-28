import 'dart:io';

import 'package:flutter/foundation.dart';

enum ScreenSize {
  small(label: "small", minBreakpoint: 0, maxBreakpoint: 600),
  medium(label: "medium", minBreakpoint: 601, maxBreakpoint: 840),
  large(label: "large", minBreakpoint: 841, maxBreakpoint: 3000);

  const ScreenSize({
    required this.label,
    required this.minBreakpoint,
    required this.maxBreakpoint,
  });

  final String label;
  final double minBreakpoint;
  final double maxBreakpoint;
}

bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
bool get isDesktopDevice =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
