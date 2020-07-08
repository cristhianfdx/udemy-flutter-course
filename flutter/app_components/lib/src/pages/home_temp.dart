import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final _options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temp Components'),
      ),
      body: ListView(
        children: _createItemsShortForm(),
      ),
    );
  }

  // List<Widget> _createItems() {
  //   List<Widget> items = new List<Widget>();

  //   for (var opt in _options) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );
  //     items..add(tempWidget)..add(Divider());
  //   }

  //   return items;
  // }

  List<Widget> _createItemsShortForm() {
    return _options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('some thing!'),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
