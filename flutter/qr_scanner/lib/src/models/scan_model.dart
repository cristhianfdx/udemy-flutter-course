import 'package:latlong/latlong.dart';

class Scan {
  Scan({
    this.id,
    this.type,
    this.value,
  }) {
    if (this.value.contains('http')) {
      this.type = 'http';
    } else {
      this.type = 'geo';
    }
  }

  int id;
  String type;
  String value;

  factory Scan.fromJson(Map<String, dynamic> json) => Scan(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };

  LatLng getLatLng() {
    final latLng = value.substring(4).split(',');
    return LatLng(double.parse(latLng[0]), double.parse(latLng[1]));
  }
}
