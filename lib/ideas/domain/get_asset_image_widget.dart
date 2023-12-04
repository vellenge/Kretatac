import 'package:flutter/material.dart';
import 'package:kretatac/ideas/domain/idea.dart';

extension GetAssetImageWidget on Idea {
  Image? getAssetImageWidget() {
    const BoxFit fit = BoxFit.cover;

    final bool isNetworkValid =
        artwork_url != null && artwork_url!.startsWith('http');

    final networkWidget = Image.network(
      artwork_url!,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        debugPrint(error.toString());
        return const Text("Échec d'obtention de l'image depuis le réseau");
      },
    );

    return artwork != null && artwork != ''
        ? Image.asset(
            "images/${artwork!}",
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              debugPrint(error.toString());
              return isNetworkValid
                  ? networkWidget
                  : const Text(
                      "Échec d'obtention de l'image depuis les assets");
            },
          )
        : isNetworkValid
            ? networkWidget
            : null;
  }
}
