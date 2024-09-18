class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print("hello , i am $name $age");
  }
}

class Baby extends Person {
  Baby(super.name, super.age);

  void sayHello() {
    print("baby  hello  i am $name $age");
  }

  void sayBaby() {
    print("i am  you father");
  }
}
