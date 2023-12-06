import 'package:flutter/material.dart';

class OverlayContainer extends StatefulWidget {
  /// The child to render in the regular document flow (defaults to Container())
  final Widget? child;

  /// The widget to render inside the [OverlayEntry].
  final Widget overlay;

  /// Offset to apply to the [CompositedTransformFollower]
  final Offset? offset;

  /// Controlling whether the overlay is current showing or not.
  ///
  /// Note: if you have an animated component you'll probably need to leave this `true`
  /// and wrap your floating widget in a `Visible`:
  /// ```dart
  /// Visibility(
  ///   visible: isVisible,
  ///   maintainSize: true,
  ///   maintainState: true,
  ///   maintainAnimation: true,
  ///   // ...
  /// ```
  final bool show;

  const OverlayContainer({
    super.key,
    required this.overlay,
    this.child,
    this.offset,
    this.show = true,
  });

  @override
  _OverlayContainerState createState() => _OverlayContainerState();
}

class _OverlayContainerState extends State<OverlayContainer>
    with WidgetsBindingObserver {
  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    if (widget.show) {
      _show();
    }
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    // We would want to re render the overlay if any metrics
    // ever change.
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We would want to re render the overlay if any of the dependencies
    // ever change.
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void didUpdateWidget(OverlayContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show) {
      _show();
    } else {
      _hide();
    }
  }

  @override
  void dispose() {
    if (widget.show) {
      _hide();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _show() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (true) {
        _overlayEntry = _buildOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        _overlayEntry.markNeedsBuild();
      }
    });
  }

  void _hide() {
    if (_overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _overlayEntry.remove();
        // _overlayEntry = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to changes in media query such as when a device orientation changes
    // or when the keyboard is toggled.
    // MediaQuery.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.child ?? Container(),
    );
  }

  OverlayEntry _buildOverlayEntry() {
    return OverlayEntry(
      opaque: false,
      builder: (context) {
        return FittedBox(
          fit: BoxFit.cover,
          child: CompositedTransformFollower(
            offset: widget.offset ?? const Offset(0, 0),
            link: _layerLink,
            //showWhenUnlinked: false,
            child: FittedBox(
              fit: BoxFit.none,
              child: widget.overlay,
            ),
          ),
        );
      },
    );
  }
}
