// ignore_for_file: avoid_print

import 'box.dart';
import 'person.dart';

/// Standalone Dart syntax examples, intentionally kept outside production code.
Future<void> main() async {
  final person = Person('tom', 20)..sayHello();
  final baby = Baby('baby', 3)
    ..sayHello()
    ..sayBaby();
  final boxes = <Box<Object>>[Box<int>(30), Box<String>('box')];
  print('${person.name}, ${baby.name}, ${boxes.map((box) => box.name)}');

  final values = <String, int>{'first': 1, 'second': 2};
  values.forEach((key, value) => print('$key -> $value'));

  await Future<void>.delayed(const Duration(milliseconds: 10));
  print('async example finished');
}
