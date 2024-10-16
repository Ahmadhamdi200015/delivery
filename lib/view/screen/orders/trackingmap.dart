import 'package:delivery/controller/orders/tracking_controller.dart';
import 'package:delivery/view/widget/auth/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingMap extends StatelessWidget {
  const TrackingMap({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingController controllerPage = Get.put(TrackingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking Map"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: GetBuilder<TrackingController>(
          builder: (controllerPage) => HandlingDataView(
              statusRequest: controllerPage.statusRequest,
              widget: Column(
                children: [
                  Expanded(
                      child: Container(
                        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          polylines: controllerPage.polyLinesSet,
                          markers: controllerPage.markers.toSet(),
                          initialCameraPosition: controllerPage.cameraPosition!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerPage.gmc=controllermap;
                          },
                        ),
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
