import 'package:anilibria_app/utils/debouncer.dart';
import 'package:flutter/material.dart';

class AutoHideController extends ChangeNotifier {
  bool _isVisible;
  bool get isVisible => _isVisible;

  final Debouncer _debouncer;

  AutoHideController({required Duration duration, bool initialValue = false})
      : _debouncer = Debouncer(delay: duration),
        _isVisible = initialValue;

  void trigger() {
    if (_isVisible) {
      _debouncer.run(() {
        _isVisible = false;
        notifyListeners();
      });
    }

    _isVisible = !_isVisible;
    notifyListeners();
  }
}

class AutoHide extends StatelessWidget {
  const AutoHide({
    this.child,
    required this.switchDuration,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final AutoHideController controller;
  final Duration switchDuration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: switchDuration,
      child: controller.isVisible ? child : const SizedBox.shrink(),
    );
  }
}
