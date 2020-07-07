import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _textStyle = TextStyle(fontSize: 26.0);
  final _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Click's Number:",
              style: _textStyle,
            ),
            Text(
              '$_count',
              style: _textStyle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('Hello World'),
      ),
    );
  }
}
