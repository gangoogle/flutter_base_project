import 'dart:ffi';

import 'package:first_project/api/api_ext.dart';
import 'package:first_project/api/app_cache.dart';
import 'package:first_project/network/dio_api.dart';
import 'package:first_project/util/RandomUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../api/dialog_ext.dart';
import 'home_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  @override
  void onInit() {
    super.onInit();
    setUserName();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void setUserName() async {
    state.userName.value = await AppCache.getUserName() ?? "";
  }

  /// 重新设置用户名
  void reSaveUserName() {
    var randomString = generateRandomString(5);
    state.userName.value = randomString;
    AppCache.saveUserName(randomString);
  }

  void addCountObs() {
    state.count++;
  }

  void requestData(BuildContext context) async {
    BuildContext? dialog;
    showLoadingDialog(context, (dialogContext) => dialog = dialogContext);
    var result = DioApi.login("loginName");
    result.then((value) {
      state.requestResult.value = value.datas[0].title;
      update();
    }).catchError((err) {
      print(err.toString());
    }).whenComplete(() {
      dialog?.hide();
    });
  }
}
