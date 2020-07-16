import 'package:flutter/widgets.dart';

import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/pages/movie_detail_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (contex) => HomePage(),
  '/detail': (contex) => MovieDetail(),
};
