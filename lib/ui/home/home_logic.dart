import 'package:first_project/data/api/dialog_ext.dart';
import 'package:first_project/network/dio_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'home_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  void resetName() {
    state.name = "new Word";
    update();
  }

  void resetNameNext() {
    state.name = "next word";
    update();
  }

  void addCountObs() {
    state.count++;
  }

  void requestData(BuildContext context) async {
    BuildContext? dialog;
    showLoadingDialog(context, (dialogContext) => dialog = dialogContext);
    var result = DioApi.login("loginName");
    result.then((value) {
      state.name = value.datas[0].title;
      update();
    }).catchError((err) {
      print(err.toString());
    }).whenComplete(() {
      dialog?.hide();
    });
  }
}
