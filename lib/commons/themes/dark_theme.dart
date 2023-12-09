import 'package:flutter/material.dart';
import 'package:kretatac/commons/themes/extended_colors.dart';

final darkTheme = ThemeData(
  // brightness: Brightness.dark,
  extensions: [
    ExtendedColor(
        yellow: const Color.fromARGB(255, 244, 191, 0),
        ctaColor: const Color.fromARGB(255, 11, 228, 47),
        accentColor: const Color.fromARGB(255, 255, 131, 7))
  ],
  fontFamily: 'Roboto',
  colorScheme: ColorScheme.fromSeed(
      onBackground: Colors.black,
      onSurface: Colors.black,
      seedColor: const Color.fromARGB(255, 243, 128, 5),
      primary: const Color.fromARGB(255, 255, 77, 7)),
  cardColor: const Color.fromARGB(255, 251, 234, 232),
  dividerColor: Colors.transparent,
  useMaterial3: true,
);
