import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/funcation/getdecodepolyline.dart';
import 'package:delivery/core/funcation/status_request.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.success;
  late myOrders myOrderModel;
  double? deslat;
  double? deslng;
  double? currentlat;
  double? currentlng;
  Set<Polyline> polyLinesSet = {};

  getCurrentLocation() {
    cameraPosition = CameraPosition(
        target: LatLng(double.parse(myOrderModel.addressLat.toString()),
            double.parse(myOrderModel.addressLong.toString())),
        zoom: 12.7);
    markers.add(Marker(markerId:const MarkerId("dest"),
        position: LatLng(double.parse(myOrderModel.addressLat.toString()),
            double.parse(myOrderModel.addressLong.toString()))));
    positionStream = Geolocator.getPositionStream().listen((Position position){
      currentlat=position.latitude;
      currentlng=position.longitude;

      if(gmc!=null){
        gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!, currentlng!)));
      }
      markers.removeWhere((e)=>e.markerId.value=="current");
      markers.add(Marker(markerId: const MarkerId("current"),position: LatLng(position.latitude!,position.longitude!)));
      update();
    });
  }

  refreshLocationDelivery()async{
    await Future.delayed(const Duration(seconds: 3));
    FirebaseFirestore.instance.collection("delivery").doc(myOrderModel.ordersId.toString()).set({
      "lat":currentlat.toString(),
      "long":currentlng.toString(),
      "deliveryid":"1"
    });
  }
  initPolyline()async{
    deslat=double.parse(myOrderModel.addressLat.toString());
    deslng=double.parse(myOrderModel.addressLong.toString());

    await Future.delayed(const Duration(seconds: 3));
    await getPolyLine(currentlat, currentlng, deslat, deslng);
    update();

  }

 @override
  void onClose() {
   positionStream!.cancel();
    gmc!.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    myOrderModel=Get.arguments['ordermodel'];
    getCurrentLocation();
    refreshLocationDelivery();
    initPolyline();
    super.onInit();
  }
}
