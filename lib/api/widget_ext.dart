import 'package:flutter/cupertino.dart';

Widget Space({double width = 0, double height = 0}) {
  return Padding(padding: EdgeInsets.only(left: width, top: height));
}

Widget SpliteLineH() {
  return Container(
    height: 1,
    color: Color(0xFFE5E5E5),
  );
}
