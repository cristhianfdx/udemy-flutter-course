void main() {
  Map<String, dynamic> myMap = {
    'name': 'Cristhian',
    'age': '28',
    'single': true
  };

  print(myMap);
  print(myMap['name']);

  myMap.forEach((key, value) {
    print('$key -> $value');
  });

  myMap.addAll({'lastname': 'Forero'});

  print(myMap);
}
