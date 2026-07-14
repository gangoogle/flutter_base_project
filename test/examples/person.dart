// ignore_for_file: avoid_print

/// Basic inheritance example.
class Person {
  Person(this.name, this.age);

  String name;
  int age;

  void sayHello() => print('hello, I am $name $age');
}

class Baby extends Person {
  Baby(super.name, super.age);

  @override
  void sayHello() => print('baby, I am $name $age');

  void sayBaby() => print('I am a baby');
}
