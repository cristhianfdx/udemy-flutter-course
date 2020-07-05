void main() {
  greeting();
  print(getName('Cristhian'));

  String message = greetingWithParameter(text: 'Hello', name: 'Crishian');
  print(message);

  print(arrow());
}

void greeting() {
  print('Hello');
}

String getName(String name) {
  return name;
}

String greetingWithParameter({String text, String name}) {
  return '$text, $name';
}

String arrow() => 'Arrow Function';
