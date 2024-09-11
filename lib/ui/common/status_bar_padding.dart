import 'package:flutter/material.dart';

///状态栏Padding
class StatusBarPaddingView extends StatefulWidget {
  StatusBarPaddingView({Key? key, this.color = Colors.transparent})
      : super(key: key);
  late Color color;

  @override
  _StatusBarPaddingViewState createState() => _StatusBarPaddingViewState();
}

class _StatusBarPaddingViewState extends State<StatusBarPaddingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).padding.top;
    return Container(
      height: height,
      color: widget.color,
    );
  }
}
