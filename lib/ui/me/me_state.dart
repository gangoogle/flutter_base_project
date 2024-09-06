import 'package:first_project/data/bean/ItemData.dart';
import 'package:first_project/util/RandomUtils.dart';
import 'package:get/get.dart';

class MeState {
  var test = 100;
  var gridViewList = [
    ItemData("hello", getRandomColor()),
    ItemData("world", getRandomColor()),
    ItemData("java", getRandomColor())
  ];

  MeState() {
    ///Initialize variables
  }
}
