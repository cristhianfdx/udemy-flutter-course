import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_scanner/src/models/scan_model.dart';
export 'package:qr_scanner/src/models/scan_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    return await initDB();
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'scan_db.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE scans ('
          'id INTEGER PRIMARY KEY,'
          'type TEXT,'
          'value TEXT'
          ')');
    });
  }

  createScan(Scan scan) async {
    final db = await database;
    return await db.insert('scans', scan.toJson());

    // final result = await db.rawInsert(
    //     "INSERT INTO scans (`type`, `value`) VALUES('${scan.type}', '${scan.value}')");
    // return result;
  }

  Future<Scan> getScan(int id) async {
    final db = await database;
    final result = await db.query('scans', where: 'id=?', whereArgs: [id]);
    return result.isNotEmpty ? Scan.fromJson(result.first) : null;
  }

  Future<List<Scan>> getScans() async {
    final db = await database;
    final result = await db.query('scans');

    return result.isNotEmpty
        ? result.map((scan) => Scan.fromJson(scan)).toList()
        : [];
  }

  Future<List<Scan>> getScansByType(String type) async {
    final db = await database;
    final result =
        await db.query('scans', where: 'type=?', whereArgs: [type]);

    return result.isNotEmpty
        ? result.map((scan) => Scan.fromJson(scan)).toList()
        : [];
  }

  Future<int> updateScan(Scan scan) async {
    final db = await database;
    return await db
        .update('scans', scan.toJson(), where: 'id=?', whereArgs: [scan.id]);
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    return await db.delete('scans', where: 'id=?', whereArgs: [id]);
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    return await db.delete('scans');
  }
}
