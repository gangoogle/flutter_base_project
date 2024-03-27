import 'package:first_project/main.dart';
import 'package:objectbox/objectbox.dart';

import 'user.dart';

class UserControl {
  static Box<User> _getUserBox() {
    return objectbox.store.box<User>();
  }

  static void addUser(User user) {
    _getUserBox().put(user);
  }
}
