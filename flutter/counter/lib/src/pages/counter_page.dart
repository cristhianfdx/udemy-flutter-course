import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _textStyle = TextStyle(fontSize: 26.0);
  int _count = 0;

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
        floatingActionButton: _createButtons()
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30,
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: _reset,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _substraction,
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _add,
        )
      ],
    );
  }

  void _add() => setState(() => _count++);

  void _substraction() => setState(() => _count--);

  void _reset() => setState(() => _count = 0);
}
