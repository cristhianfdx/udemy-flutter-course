import 'package:flutter/material.dart';

import 'package:barcode_scan/barcode_scan.dart';

import 'package:qr_scanner/src/pages/addresses_page.dart';
import 'package:qr_scanner/src/pages/maps_page.dart';

import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/bloc/scans_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scanBloc = ScansBloc();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    scanBloc.getScans();

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                scanBloc.deleteAllScans();
              })
        ],
      ),
      body: _loadPage(currentIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Maps')),
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_5), title: Text('Addresses'))
        ]);
  }

  Widget _loadPage(int actualPage) {
    if (actualPage == 0) {
      return MapsPage();
    }
    return AddressesPage();
  }

  _scanQR() async {
    var futureString;

    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }

    if (futureString != null) {
      final scan = Scan(value: futureString.rawContent);
      scanBloc.createScan(scan);
    }
  }
}
