import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class CostWidget extends StatelessWidget {
  const CostWidget(
      {super.key,
      required this.cost,
      this.height = 60,
      this.width = 60,
      this.sides = 6,
      this.color});

  final int cost;
  final double height;
  final double width;
  final int? sides;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).textScaleFactor;

    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              offset: const Offset(4, 4),
              color: Theme.of(context).colorScheme.onBackground,
            )
          ],
          color: color ?? Theme.of(context).colorScheme.background,
          shape: PolygonBorder(
              sides: sides ?? 6,
              borderRadius: 6,
              side: BorderSide(
                  width: 5,
                  color: Theme.of(context).colorScheme.onBackground))),
      child: Center(
        child: Text(
          cost.toString(),
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: ratio * 40,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
