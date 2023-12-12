import 'package:flutter/material.dart';
import 'package:kretatac/counter_tag/domain/counter_tag.dart';
import 'package:kretatac/counter_tag/presentation/counter_tag_badge.dart';

class CounterTagButton extends StatelessWidget {
  const CounterTagButton({super.key, required this.counterTag, this.onTap});

  final CounterTag counterTag;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CounterTagbadge(
      counterTag: counterTag,
    );
  }
}
