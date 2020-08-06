import 'package:flutter/material.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import 'package:qr_scanner/src/models/scan_model.dart';

launchURL(BuildContext context, Scan scan) async {
  if ('http' == scan.type) {
    _launch(scan.value);
  } else {
    _launchGEO(context, scan);
  }
}

_launchGEO(BuildContext context, Scan scan) async {
  if (Platform.isIOS) {
    Future.delayed(Duration(milliseconds: 750), () {
      Navigator.pushNamed(context, 'map', arguments: scan);
    });
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}

_launch(String value) async {
  if (await canLaunch(value)) {
    await launch(value);
  }
}
