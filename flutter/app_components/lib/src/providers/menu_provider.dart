import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider();

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('resources/menu_options.json');
    options = json.decode(response)['routes'];
    return options;
  }
}

final menuProvider = _MenuProvider();
