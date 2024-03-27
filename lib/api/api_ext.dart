import 'dart:ui';

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
