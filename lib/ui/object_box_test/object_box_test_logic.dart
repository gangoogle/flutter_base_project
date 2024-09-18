import 'package:first_project/database/user_control.dart';
import 'package:get/get.dart';

import '../../database/user.dart';
import '../../util/random_utils.dart';
import 'object_box_test_state.dart';

class ObjectBoxTestLogic extends GetxController {
  final ObjectBoxTestState state = ObjectBoxTestState();

  @override
  void onInit() {
    super.onInit();
    _queryUser();
  }

  void _queryUser() async {
    var list = UserControl.getAllUser();
    state.data.clear();
    state.data.addAll(list);
  }

  void addNewUser() async {
    var user = User();
    user.name = generateRandomString(5);
    user.comment = generateRandomString(10);
    user.text = generateRandomString(5);
    UserControl.addUser(user);
    state.data.add(user);
  }

  void deleteUser(User user) async {
    UserControl.deleteUser(user);
    state.data.remove(user);
  }

  void updateUser(User user, String newText) async {
    user.name = newText;
    UserControl.updateUser(user);
    state.data.refresh();
  }
}
