import 'package:flutter/material.dart';

class ExtendedColor extends ThemeExtension<ExtendedColor> {
  ExtendedColor({
    required this.ctaColor,
    required this.accentColor,
    required this.yellow,
  });

  final Color ctaColor;
  final Color accentColor;
  final Color yellow;

  @override
  ExtendedColor copyWith({Color? accentColor, Color? ctaColor, Color? yellow}) {
    return ExtendedColor(
        ctaColor: ctaColor ?? this.ctaColor,
        yellow: yellow ?? this.yellow,
        accentColor: accentColor ?? this.accentColor);
  }

  @override
  ExtendedColor lerp(covariant ThemeExtension<ExtendedColor>? other, double t) {
    if (other! is ExtendedColor) {
      return this;
    }

    return ExtendedColor(
        ctaColor: ctaColor, accentColor: accentColor, yellow: yellow);
  }
}
