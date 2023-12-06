import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/game/presentation/widgets/jauge_widget.dart';
import 'package:kretatac/game/presentation/widgets/wallet_widget.dart';

class WalletAndJaugeWidget extends StatelessWidget {
  const WalletAndJaugeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: Sizes.p12, right: Sizes.p64),
          child: JaugeWidget(width: width),
        ),
        const Positioned(right: Sizes.p4, child: WalletWidget())
      ]),
    );
  }
}
