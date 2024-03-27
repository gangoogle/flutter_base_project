import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  StatusBar({
    Key? key,
    this.color = Colors.transparent,
    this.tintColor = Colors.white,
    required this.onBack,
  }) : super(key: key);
  Color color;
  Color tintColor;
  VoidCallback onBack;

  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Padding(
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
    );
  }
}
