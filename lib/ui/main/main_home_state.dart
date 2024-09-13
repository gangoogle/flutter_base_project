import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainHomeState {
  var selectIndex = 0.obs;
  var pageControl = PageController(initialPage: 0, keepPage: true);

  MainHomeState() {}
}
