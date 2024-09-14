import 'dart:ffi';
import 'dart:io';
import 'Box.dart';
import 'Person.dart';

void main() {
  var person = Person('tom', 20);
  person.sayHello();
  var baby = Baby("age", 30);
  baby.sayHello();
  int? age = null;
  if ((age ?? 10) > 20) {
    print("age > 20 ");
  } else {
    print("age < 20 ");
  }
  try {
    throw Exception("抛出异常");
  } catch (e) {
    print(e);
  } finally {
    print("done");
  }
  Box<int> boxA = Box<int>(30);
  var boxB = Box<int>(40);
  var boxC = Box<String>("boxC");
  print('${boxA.name} ${boxB.name} ${boxC.name}');
  int b = 30;

  int intA = 23;
  double doubleA = 23.3;
  bool boolA = true;
  var listA = [1, 2];
  List<int> listB = [3, 4];
  var setA = {"test", "a"};
  Set<String> setB = {"test", "testB"};
  setA.add("x");
  setB.add("ao");
  setB.addAll(setA);
  var mapA = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  Map<int, String> mapB = {1: '232', 2: '343'};
  mapA['x'] = "xx";
  print('map a ${mapA['first']}');
  print('map b ${mapB[1]}');
  mapA.forEach((action, value) {
    print('foreach -> $action $value');
  });
  var mapConst = const {1: 2, 2: 3};
  print("map const -> ${mapConst[1]}");
  Object objectTest = "23";
  print(
      'object step 1 -> ${objectTest} | value of -> ${objectTest.runtimeType}');
  objectTest = 1;
  print(
      "object step 2 -> ${objectTest} | value of -> ${objectTest.runtimeType}");
  int? lineCount;
  print("lineCount赋值前-> ${lineCount ??= 32} ");
  print("赋值中-> ${lineCount}");
  lineCount = 30;
  print("lineCount赋值后-> $lineCount");
  final nameFinal = "bob";
  const nameConst = "n";
  print("三元 ${nameConst.length > 2 ? ">2" : "<2"}");
  Person personBaby = Baby("baby", 23);
  personBaby.sayHello();
  if (personBaby is Baby) {
    personBaby.sayBaby();
  }
  doTask();
}

void doTask() async {
  print("sleep start");
  await Future.delayed(Duration(milliseconds: 2000));
  print("sleep finish 1");
  await Future.delayed(Duration(milliseconds: 2000));
  print("sleep finish 2");
}
