import 'package:flutter/material.dart';

class StatusBar extends StatefulWidget {
  StatusBar(
      {Key? key,
      this.color = Colors.transparent,
      this.tintColor = Colors.white})
      : super(key: key);
  Color color;
  Color tintColor;

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
            Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: widget.tintColor,
            )
          ],
        ),
      ),
    );
  }
}
