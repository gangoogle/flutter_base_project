import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension StringExt on String {
  Color get color => hexColorString(this);
}

Color hexColorString(String hexColor) {
  Color color = Color(getColorFromHex(hexColor));
  return color;
}

int getColorFromHex(String hexColor) {
  if (hexColor.startsWith("#")) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
  } else {
    hexColor = hexColor.toUpperCase();
  }
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return int.parse(hexColor, radix: 16);
}

void setStatusColor(bool isDarkMode) {
  var brightness = Brightness.light;
  if (isDarkMode) {
    brightness = Brightness.dark;
  }

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // 状态栏颜色设置透明
    statusBarColor: Colors.transparent,
    // 状态栏图标为深色
    statusBarBrightness: brightness,
    // 状态栏图标亮度
    statusBarIconBrightness: brightness,
  ));
}
