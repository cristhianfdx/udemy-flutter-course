import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:qr_scanner/src/models/scan_model.dart';

class MapPage extends StatelessWidget {
  final controller = new MapController();

  @override
  Widget build(BuildContext context) {
    final Scan scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordinates'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {
                controller.move(scan.getLatLng(), 13.0);
              })
        ],
      ),
      body: _createFlutterMap(scan),
    );
  }

  Widget _createFlutterMap(Scan scan) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(center: scan.getLatLng(), zoom: 13.0),
      layers: [_createMap(), _createMarker(scan)],
    );
  }

  LayerOptions _createMap() {
    return TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']);
  }

  LayerOptions _createMarker(Scan scan) {
    return MarkerLayerOptions(
      markers: [
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (BuildContext context) => Container(
            child: Icon(
              Icons.location_on,
              size: 70.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
