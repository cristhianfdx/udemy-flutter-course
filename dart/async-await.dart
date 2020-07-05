void main() async {
  print('Init');

  final String data = await httpGet('https://api.com');
  print(data);

  print('end');
}

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Hello World';
  });
}
