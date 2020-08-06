import 'dart:async';

import 'package:qr_scanner/src/models/scan_model.dart';

class Validator {
  final geoValidate = StreamTransformer<List<Scan>, List<Scan>>.fromHandlers(
    handleData: (data, sink) {
      final geoScans = data.where((element) => element.type == 'geo').toList();
      sink.add(geoScans);
    },
  );

  final httpValidate = StreamTransformer<List<Scan>, List<Scan>>.fromHandlers(
    handleData: (data, sink) {
      final httpScans =
          data.where((element) => element.type == 'http').toList();
      sink.add(httpScans);
    },
  );
}
