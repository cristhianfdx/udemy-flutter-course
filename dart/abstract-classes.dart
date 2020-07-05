void main() {
  final dog = new Dog();
  dog.soundEmmit();
}

abstract class Animal {
  int legs;
  void soundEmmit();
}

class Dog implements Animal {
  @override
  int legs;

  @override
  void soundEmmit() {
    print('Guauguau');
  }
}
