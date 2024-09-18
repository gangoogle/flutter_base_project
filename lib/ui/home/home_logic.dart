import 'package:first_project/api/api_ext.dart';
import 'package:first_project/api/app_cache.dart';
import 'package:first_project/network/api_server.dart';
import 'package:first_project/util/random_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../api/dialog_ext.dart';
import 'home_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  @override
  void onInit() {
    super.onInit();
    setUserName();
    _getFilePath();
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
    ApiServer.getArticleList("loginName").then((value) {
      state.requestResult.value = value.datas[0].title;
      update();
    }).catchError((err) {
      showErrorToast(err.toString());
    }).whenComplete(() {
      dialog?.hide();
    });
  }

  void _getFilePath() async {
    final tempDir = await getTemporaryDirectory();
    final appDir = await getApplicationDocumentsDirectory();
    final downloadDir = await getDownloadsDirectory();
    print(
        "文件目录  \n tempDir:${tempDir.path} \n appDir:${appDir.path} \n downloadDir:${downloadDir?.path ?? ""}");
  }
}
