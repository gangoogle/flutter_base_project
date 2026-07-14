import 'package:first_project/database/user_control.dart';
import 'package:get/get.dart';

import '../../database/user.dart';
import '../../util/random_utils.dart';

class ObjectBoxTestLogic extends GetxController {
  final data = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    _queryUser();
  }

  void _queryUser() async {
    var list = UserControl.getAllUser();
    data.clear();
    data.addAll(list);
  }

  void addNewUser() async {
    var user = User();
    user.name = generateRandomString(5);
    user.comment = generateRandomString(10);
    user.text = generateRandomString(5);
    UserControl.addUser(user);
    data.add(user);
  }

  void deleteUser(User user) async {
    UserControl.deleteUser(user);
    data.remove(user);
  }

  void updateUser(User user, String newText) async {
    user.name = newText;
    UserControl.updateUser(user);
    data.refresh();
  }
}
