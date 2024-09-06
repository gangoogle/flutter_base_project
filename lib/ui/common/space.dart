import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double width;
  final double height;

  const Space({super.key, this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: width, top: height));
  }
}
