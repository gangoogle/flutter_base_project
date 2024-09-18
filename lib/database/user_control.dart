import 'package:objectbox/objectbox.dart';

import '../../main.dart';
import 'user.dart';

class UserControl {
  static Box<User> _getUserBox() {
    return objectbox.store.box<User>();
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
}
