import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoadingDialog(BuildContext context,
    void Function(BuildContext dialogContext) call) async {
  showDialog(
      context: context,
      builder: (context) {
        call(context);
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

hideLoadingDialog(BuildContext? context) {
  if (context != null) {
    Navigator.pop(context);
  }
}

extension BuildContextExtension on BuildContext {
  void hide() {
    hideLoadingDialog(this);
  }
}
