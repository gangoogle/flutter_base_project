import 'package:flutter/material.dart';

/// A loading overlay that can only remove itself, so it never pops a route.
class LoadingOverlay {
  LoadingOverlay._(this._entry);

  final OverlayEntry _entry;
  bool _closed = false;

  static LoadingOverlay show(BuildContext context) {
    final entry = OverlayEntry(
      builder: (_) => const Stack(
        children: [
          ModalBarrier(dismissible: false, color: Colors.black26),
          Center(child: CircularProgressIndicator()),
        ],
      ),
    );
    Overlay.of(context, rootOverlay: true).insert(entry);
    return LoadingOverlay._(entry);
  }

  void close() {
    if (_closed) return;
    _closed = true;
    _entry.remove();
    _entry.dispose();
  }
}
