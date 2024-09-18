import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

///字符串转color
extension StringExt on String {
  Color get color => hexColorString(this);
}

/// 16进制颜色转color
Color hexColorString(String hexColor) {
  Color color = Color(getColorFromHex(hexColor));
  return color;
}

/// 16进制颜色转int
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

/// 修改状态栏颜色模式
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

void showErrorToast(String text) {
  toastification.show(
      alignment: Alignment.bottomCenter,
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(text));
}
