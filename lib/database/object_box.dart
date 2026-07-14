import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class ObjectBox {
  static ObjectBox? _instance;

  final Store store;
  ObjectBox._create(this.store);

  static ObjectBox get instance {
    final value = _instance;
    if (value == null) {
      throw StateError('ObjectBox has not been initialized.');
    }
    return value;
  }

  static Future<ObjectBox> initialize() async {
    return _instance ??= await create();
  }

  static Future<ObjectBox> create({String? directory}) async {
    final databaseDirectory =
        directory ??
        p.join((await getApplicationDocumentsDirectory()).path, 'obx-example');
    final store = await openStore(directory: databaseDirectory);
    return ObjectBox._create(store);
  }

  /// Replaces the singleton for an isolated test database.
  static void useForTesting(ObjectBox value) {
    assert(() {
      _instance = value;
      return true;
    }());
  }

  void close() {
    if (!store.isClosed()) {
      store.close();
    }
    if (identical(_instance, this)) {
      _instance = null;
    }
  }
}
