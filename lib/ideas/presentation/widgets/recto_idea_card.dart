import 'package:flutter/material.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/ideas/domain/get_asset_image_widget.dart';
import 'package:kretatac/ideas/domain/idea.dart';
import 'package:kretatac/ideas/presentation/widgets/cost_widget.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class RectoIdeaWidget extends StatelessWidget {
  const RectoIdeaWidget(
      {super.key,
      required this.idea,
      this.onPressed,
      this.offset,
      this.showCost = true});

  final Idea idea;
  final Function()? onPressed;
  final bool showCost;
  final Offset? offset;

  @override
  Widget build(BuildContext context) {
    const double size = 40;

    return InkWell(
      onTap: onPressed,
      child: NeuCard(
        offset: offset ?? neuOffset,
        borderRadius: BorderRadius.circular(Sizes.p4),
        child: Stack(children: [
          Positioned.fill(
            child: Container(
                clipBehavior: Clip.none,
                color: Theme.of(context).colorScheme.error,
                child: idea.getAssetImageWidget()),
          ),
          showCost
              ? CostWidget(
                  sizeFactor: 0.5,
                  cost: idea.cost,
                  height: size,
                  width: size,
                )
              : const SizedBox(
                  height: size,
                )
        ]),
      ),
    );
  }
}
