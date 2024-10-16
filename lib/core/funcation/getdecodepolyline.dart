import 'dart:convert';

import 'package:delivery/core/constant/color.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Set<Polyline> polyLinesSet = {};
List<LatLng> polylineCoordinates = [];
PolylinePoints polylinePoints = PolylinePoints();
String keyGlobalMap = "AIzaSyDc7h8cjmsgKVcjMkKGRwQExhd2pGmLgjQ";

Future getPolyLine(lat, long, destLat, destLong) async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?destination=$destLat,$destLong&origin=$lat,$long &key=$keyGlobalMap";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointlatlng) {
      polylineCoordinates
          .add(LatLng(pointlatlng.latitude, pointlatlng.longitude));
    });
  }
  Polyline polyline = Polyline(
      polylineId: const PolylineId("delivery"),
      color: AppColor.primaryColor,
      width: 5,
      points: polylineCoordinates);
  polyLinesSet.add(polyline);
  return polyLinesSet;
}
