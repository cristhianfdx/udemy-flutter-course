void main() {
  final superman = new Hero();
  superman.name = 'Clark Kent';

  final luthor = new Villain();
  luthor.name = 'Lex Luthor';
}

abstract class Character {
  String name;
  String power;
}

class Hero extends Character {
  int courage;
}

class Villain extends Character {
  int evil;
}
