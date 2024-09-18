import 'package:flutter/material.dart';

class GlobalScaffold {
  GlobalScaffold._();
  static final GlobalScaffold instance = GlobalScaffold._();
  final keyScaff = GlobalKey<NavigatorState>();
  void addOverlay(OverlayEntry entry,
      {OverlayEntry? below, OverlayEntry? above, bool callback = false}) {
    if (keyScaff.currentContext != null) {
      keyScaff.currentState?.overlay?.insert(entry, below: below, above: above);
    }
  }
}
