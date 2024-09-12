import 'dart:ffi';

import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';

///状态栏

class StatusBar extends StatefulWidget {
  StatusBar({
    super.key,
    this.color = Colors.transparent,
    this.tintColor = Colors.white,
    this.openStatusPadding = false,
    required this.onBack,
  });

  Color color;
  Color tintColor;
  bool openStatusPadding;
  VoidCallback onBack;

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Column(
        children: [
          Visibility(
              visible: widget.openStatusPadding, child: StatusBarPaddingView()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    widget.onBack();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                    color: widget.tintColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
