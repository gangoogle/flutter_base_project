import 'package:first_project/ui/common/status_bar_padding.dart';
import 'package:flutter/material.dart';

///状态栏
class StatusBar extends StatefulWidget {
  const StatusBar({
    super.key,
    this.color = Colors.transparent,
    this.tintColor = Colors.white,
    this.openStatusPadding = false,
    this.title = "",
    required this.onBack,
  });

  final Color color;
  final Color tintColor;
  final bool openStatusPadding;
  final VoidCallback onBack;
  final String title;

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
                InkWell(
                  onTap: () {
                    widget.onBack();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
