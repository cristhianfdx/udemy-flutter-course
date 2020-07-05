import 'dart:convert';

void main() {
  var wolverine = new Hero(name: 'Logan', power: 'Regeneration');
  final spiderman = new Hero(name: 'Peter');

  print(wolverine);
  print(spiderman);

  final student = new Student('Luis', 'Math');
  print(student);

  // JSON Mapped
  final rawJson = '{"name": "Logan", "power": "Regeneration"}';
  final parsedJson = json.decode(rawJson);
  print(parsedJson);

  final wolv = new Hero.fromJson(parsedJson);
  print(wolv);

  // getters and setters example

  final square = new Square();
  square.side = 2.3;
  print(square.getArea);
}

class Hero {
  String name;
  String power;

  Hero({String name, String power = 'without power'}) {
    this.name = name;
    this.power = power;
  }

  // Constructor with name
  Hero.fromJson(Map parsedJson) {
    name = parsedJson['name'];
    power = parsedJson['power'];
  }

  String toString() {
    return '${this.name} - ${this.power}';
  }
}

// Simple constructor
class Person {
  String name;
  int age;

  Person({String name, int age});
}

class Student {
  String name;
  String course;

  Student(String name, String course);
}

// Getters and Setters
class Square {
  double _side;
  double _area;

  set side(double side) {
    _side = side;
  }

  double get getSide {
    return _side;
  }

  double get getArea => _side * _side;
}
