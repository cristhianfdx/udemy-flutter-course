import 'package:flutter/material.dart';

import 'package:app_components/src/pages/home_page.dart';
import 'package:app_components/src/pages/alert_page.dart';
import 'package:app_components/src/pages/avatar_page.dart';
import 'package:app_components/src/pages/card_page.dart';
import 'package:app_components/src/pages/animated_container_page.dart';
import 'package:app_components/src/pages/input_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animated-container': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage()
  };
}
