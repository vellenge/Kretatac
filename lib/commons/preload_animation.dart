import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class PreloadRive extends StatefulWidget {
  const PreloadRive({super.key, required this.path, this.controllers});

  final String path;
  final List<RiveAnimationController<dynamic>>? controllers;
  @override
  State<PreloadRive> createState() => _PreloadRiveState();
}

class _PreloadRiveState extends State<PreloadRive> {
  RiveFile? _file; // You can maintain this reference to have a cached version

  @override
  void initState() {
    super.initState();
    preload();
  }

  Future<void> preload() async {
    rootBundle.load(widget.path).then(
      (data) async {
        // Load the RiveFile from the binary data.
        setState(() {
          _file = RiveFile.import(data);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_file == null)
        ? const SizedBox.shrink()
        : RiveAnimation.direct(
            _file!,
            controllers: widget.controllers ?? [],
          );
  }
}
