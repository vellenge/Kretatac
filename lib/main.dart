import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kretatac/game/application/hand_service.dart';

import 'package:kretatac/ideas/data/idea_dto.dart';
import 'package:kretatac/onboarding/data/onboarding_steps.dart';
import 'package:kretatac/onboarding/presentation/onboarding_widget.dart';
import 'package:kretatac/therapy/data/therapy_dto.dart';
import 'package:motion/motion.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

final container = ProviderContainer();
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  container.read(ideaDTOProvider);
  await container.read(ideaDTOProvider.notifier).getIdeas();
  container.read(therapiesDTOProvider);
  await container.read(therapiesDTOProvider.notifier).getTherapies();
  container.read(handServiceNotifierProvider);
  container.read(handServiceNotifierProvider.notifier).getHand();
  container.read(overlayKeysProvider);
  container.read(onBoardingStepsProvider);

  // debugRepaintRainbowEnabled = true;

  // container.read(deckRepositoryProvider);
  // container.read(deckServiceProvider);s
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List<FocusNode>.generate(
      3,
      (int i) => FocusNode(debugLabel: i.toString()),
      growable: false,
    );
  }

  final closeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final steps = onBoardingSteps;

    return UncontrolledProviderScope(
      container: container,
      child: _EagerInitialization(
        child: MaterialApp(
            title: 'KRETATAC',
            theme: ThemeData(
              extensions: [
                ExtendedColor(
                    yellow: const Color.fromARGB(255, 244, 191, 0),
                    ctaColor: const Color.fromARGB(255, 11, 228, 47),
                    accentColor: const Color.fromARGB(255, 255, 131, 7))
              ],
              fontFamily: 'Roboto',
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 243, 128, 5),
                  primary: const Color.fromARGB(255, 255, 77, 7)),
              cardColor: const Color.fromARGB(255, 251, 234, 232),
              dividerColor: Colors.transparent,
              useMaterial3: true,
            ),
            home: Onboarding(
                steps: steps,
                key: widget.onboardingKey,
                child: const OnBoardingWidget())),
      ),
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Eagerly initialize providers by watching them.
    // By using "watch", the provider will stay alive and not be disposed.
    // ref.watch(ideaDTOProvider);

    // ref.watch(deckRepositoryProvider);
    // ref.watch(deckServiceProvider);

    return child;
  }
}

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
