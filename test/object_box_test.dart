import 'dart:io';

import 'package:first_project/database/object_box.dart';
import 'package:first_project/database/user.dart';
import 'package:first_project/database/user_control.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory directory;
  late ObjectBox database;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('objectbox-test-');
    database = await ObjectBox.create(directory: directory.path);
    ObjectBox.useForTesting(database);
  });

  tearDown(() async {
    database.close();
    await directory.delete(recursive: true);
  });

  test('user CRUD uses the isolated ObjectBox store', () {
    final user = User()
      ..name = 'alice'
      ..text = 'hello'
      ..comment = 'initial';

    UserControl.addUser(user);
    expect(user.id, greaterThan(0));
    expect(UserControl.queryNameByName('alice')?.text, 'hello');

    user.comment = 'updated';
    UserControl.updateUser(user);
    expect(UserControl.getAllUser().single.comment, 'updated');

    UserControl.deleteUser(user);
    expect(UserControl.getAllUser(), isEmpty);
  });
}
