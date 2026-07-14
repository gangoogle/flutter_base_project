import 'package:first_project/database/objectbox.g.dart';

import 'object_box.dart';
import 'user.dart';

class UserControl {
  static Box<User> _getUserBox() {
    return ObjectBox.instance.store.box<User>();
  }

  static List<User> getAllUser() {
    return _getUserBox().getAll();
  }

  static void addUser(User user) {
    _getUserBox().put(user);
  }

  static void deleteUser(User user) {
    _getUserBox().remove(user.id);
  }

  static void updateUser(User user) {
    _getUserBox().put(user);
  }

  /// 根据用户名查询用户
  static User? queryNameByName(String name) {
    final query = _getUserBox().query(User_.name.equals(name)).build();
    try {
      return query.findFirst();
    } finally {
      query.close();
    }
  }
}
