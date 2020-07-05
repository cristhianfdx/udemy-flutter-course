void main() {
  print('Init');

  httpGet('https://api.com')
      .then((value) => print(value))
      .catchError((error) => print(error));

  print('end');
}

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Hello World';
  });
}
