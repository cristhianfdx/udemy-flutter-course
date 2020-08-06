import 'package:flutter/material.dart';

import 'package:qr_scanner/src/utils/utils.dart' as utils;
import 'package:qr_scanner/src/bloc/scans_bloc.dart';
import 'package:qr_scanner/src/models/scan_model.dart';

class MapsPage extends StatelessWidget {
  final scanBloc = ScansBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Scan>>(
      stream: scanBloc.scanStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('Scans is empty'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
            ),
            onDismissed: (direction) {
              scanBloc.deleteScan(scans[index].id);
            },
            child: ListTile(
              leading: Icon(
                Icons.map,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[index].value),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                utils.launchURL(context, scans[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
