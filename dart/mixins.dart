void main() {
  final duck = new Duck();
  duck.fly();
}

abstract class Animal {}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

abstract class Fly {
  void fly() => print('Fliying');
}

abstract class Swim {
  void swim() => print('Swimming');
}

abstract class Walk {
  void walk() => print('Walking');
}

class Dolphin extends Mammal with Swim {}

class Cat extends Mammal with Walk {}

class Duck extends Bird with Walk, Fly, Swim {}
