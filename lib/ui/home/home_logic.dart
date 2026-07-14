import 'package:first_project/api/api_ext.dart';
import 'package:first_project/api/app_cache.dart';
import 'package:first_project/network/api_server.dart';
import 'package:first_project/util/random_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../api/dialog_ext.dart';

class HomePageLogic extends GetxController {
  final HomePageState _state = HomePageState();
  bool _isRequesting = false;

  RxInt get count => _state.count;
  RxString get userName => _state.userName;
  RxString get requestResult => _state.requestResult;
  RxString get argsText => _state.argsText;
  RxBool get buttonVisible => _state.buttonVisible;

  @override
  void onInit() {
    super.onInit();
    setUserName();
    _getFilePath();
  }

  Future<void> setUserName() async {
    final userName = await AppCache.getUserName();
    if (!isClosed) this.userName.value = userName;
  }

  /// 重新设置用户名
  Future<void> reSaveUserName() async {
    var randomString = generateRandomString(5);
    userName.value = randomString;
    await AppCache.saveUserName(randomString);
  }

  void addCountObs() {
    count.value++;
  }

  Future<void> requestData(BuildContext context) async {
    if (_isRequesting) return;
    _isRequesting = true;
    final loading = LoadingOverlay.show(context);
    try {
      final value = await ApiServer.getArticleList();
      if (!isClosed) {
        requestResult.value = value.datas.isEmpty
            ? '暂无文章'
            : value.datas.first.title;
      }
    } catch (error) {
      if (!isClosed) showErrorToast(error.toString());
    } finally {
      loading.close();
      _isRequesting = false;
    }
  }

  void _getFilePath() async {
    final tempDir = await getTemporaryDirectory();
    final appDir = await getApplicationDocumentsDirectory();
    final downloadDir = await getDownloadsDirectory();
    if (kDebugMode) {
      debugPrint(
        '文件目录\n tempDir:${tempDir.path}\n appDir:${appDir.path}'
        '\n downloadDir:${downloadDir?.path ?? ""}',
      );
    }
  }
}

class HomePageState {
  final count = 0.obs;
  final userName = ''.obs;
  final requestResult = ''.obs;
  final argsText = ''.obs;
  final buttonVisible = true.obs;
}
