import 'dart:async';

import 'package:delivery/core/constant/route.dart';
import 'package:delivery/core/funcation/status_request.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/model/ordersmodel.dart';

class MapAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.lodaing;
  List<Marker> marker = [];
  CameraPosition? kGooglePlex;
  myOrders? myOrderModel;
  Position? position;
  double? lat;
  double? long;
  Completer<GoogleMapController>? controller;

  addMarker(LatLng latLang) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latLang));
    update();
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        target: LatLng(lat!,long!),
        zoom: 14.0);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    myOrderModel=Get.arguments['myorders'];
    lat = double.parse(myOrderModel!.addressLat.toString());
    long = double.parse(myOrderModel!.addressLong.toString());
    controller = Completer<GoogleMapController>();
    marker.add(Marker(markerId: MarkerId("client"),position: LatLng(lat!,long!)));
    getCurrentLocation();
    super.onInit();
  }
}
