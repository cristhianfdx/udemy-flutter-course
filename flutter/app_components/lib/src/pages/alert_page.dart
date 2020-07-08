import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert'),
          color: Colors.blue,
          shape: StadiumBorder(),
          padding: EdgeInsets.all(14.0),
          textColor: Colors.white,
          onPressed: () => _showAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            title: Text('Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Some Alert Content'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: [
              FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')),
              FlatButton(onPressed: (){}, child: Text('Ok'))

            ],
          );
        });
  }
}
