import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kretatac/commons/constants/app_sizes.dart';
import 'package:kretatac/main.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class StepWidget extends StatelessWidget {
  const StepWidget(
      {super.key,
      this.buttonText = 'Suivant',
      required this.title,
      required this.text,
      this.onPressed,
      this.useCustom = false,
      this.width});

  final String title;
  final String text;
  final String? buttonText;
  final void Function()? onPressed;
  final double? width;
  final bool useCustom;

  @override
  Widget build(BuildContext context) {
    final Widget button = useCustom
        ? CustomNeuButton(onPressed: onPressed)
        : NeuTextButton(
            buttonColor: Theme.of(context).extension<ExtendedColor>()!.ctaColor,
            buttonHeight: Sizes.p48,
            borderRadius: BorderRadius.circular(Sizes.p8),
            enableAnimation: true,
            text: Text(
              buttonText!,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
            onPressed: onPressed,
          );

    return Material(
      color: Colors.transparent,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onBackground,
              width: Sizes.p8,
            ),
            borderRadius: BorderRadius.circular(Sizes.p8),
            // border: Border.all(
            //   width: Sizes.p4,
            // ),
            color: Theme.of(context).colorScheme.surface,
            boxShadow: const [BoxShadow(offset: Offset(0, 0))]),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              gapH8,
              Text(text),
              Padding(
                padding: const EdgeInsets.all(Sizes.p4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button
                        .animate(
                          onComplete: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .then(delay: 500.ms)
                        .scaleXY(begin: 0.95, end: 1, curve: Curves.bounceInOut)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNeuButton extends StatefulWidget {
  const CustomNeuButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  State<CustomNeuButton> createState() => _CustomNeuButtonState();
}

class _CustomNeuButtonState extends State<CustomNeuButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: Sizes.p48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p4),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(
                Sizes.p4,
                2,
              ))
            ]),
        child: FilledButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      horizontal: Sizes.p24, vertical: Sizes.p12)),
              foregroundColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.onBackground,
              ),
              textStyle: MaterialStatePropertyAll<TextStyle>(
                Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).extension<ExtendedColor>()!.ctaColor),
              shape: MaterialStatePropertyAll<OutlinedBorder>(
                  RoundedRectangleBorder(
                      side: const BorderSide(width: Sizes.p4),
                      borderRadius: BorderRadius.circular(Sizes.p8)))),
          child: const Text('Suivant'),
        ),
      ),
    );
  }
}
