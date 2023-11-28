import 'package:flutter/material.dart';
import 'package:kretatac/commons/utils/screen_size.dart';

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    this.maxScreenSize = ScreenSize.large,
    this.padding = EdgeInsets.zero,
    required this.child,
  });

  final ScreenSize maxScreenSize;
  final EdgeInsetsGeometry padding;
  final Widget child;

  double get maxWidth => maxScreenSize.maxBreakpoint;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxWidth,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
