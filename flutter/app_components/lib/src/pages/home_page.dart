import 'package:flutter/material.dart';

import 'package:app_components/src/providers/menu_provider.dart';
import 'package:app_components/src/utils/icons_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _getListView(),
    );
  }

  Widget _getListView() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _getListItems(context, snapshot.data));
      },
    );
  }

  List<Widget> _getListItems(BuildContext context, List<dynamic> items) {
    return items.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item['text']),
            leading: getIcon(item['icon'], Colors.blue),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.pushNamed(context, item['path']);
              // final route =
              //     MaterialPageRoute(builder: (context) => AlertPage());
              // Navigator.push(context, route);
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
