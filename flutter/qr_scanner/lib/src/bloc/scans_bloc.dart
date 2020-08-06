import 'dart:async';

import 'package:qr_scanner/src/bloc/validator.dart';
import 'package:qr_scanner/src/providers/db_provider.dart';

class ScansBloc with Validator {
  static final ScansBloc _singleton = ScansBloc._();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._() {
    getScans();
  }

  final _scansController = StreamController<List<Scan>>.broadcast();

  Stream<List<Scan>> get scanStream =>
      _scansController.stream.transform(geoValidate);
  Stream<List<Scan>> get scanStreamHttp =>
      _scansController.stream.transform(httpValidate);

  void dispose() {
    _scansController?.close();
  }

  getScans() async => _scansController.sink.add(await DBProvider.db.getScans());

  createScan(Scan scan) async {
    await DBProvider.db.createScan(scan);
    getScans();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    getScans();
  }
}
