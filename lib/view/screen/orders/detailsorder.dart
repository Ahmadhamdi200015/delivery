import 'package:flutter/material.dart';
import 'package:delivery/controller/orders/details_order_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../applink.dart';
import '../../../controller/address/mapaddress_controller.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsOrderController controller = Get.put(DetailsOrderController());
    MapAddressController controllerPage = Get.put(MapAddressController());

    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(
            "Details Order",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<DetailsOrderController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Card(
                      elevation: 2.0,
                      color: AppColor.white,
                      child: Table(
                        children: [
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text(
                                "City",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Street",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                "Price Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.addressCity}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.addressStreet}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${controller.ordermodel.ordersPricedelivery}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor),
                              ),
                            ),
                          ])
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                        color: AppColor.white,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "TotalPrice",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 500,
                              child: Text(
                                "${controller.ordermodel.ordersTotalprice}\$",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: GetBuilder<MapAddressController>(
                      builder: (controllerPage) => HandlingDataView(
                        statusRequest: controllerPage.statusRequest,
                        widget: Column(
                          children: [
                            if (controllerPage.kGooglePlex != null)
                              Expanded(
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  markers: controllerPage.marker.toSet(),
                                  initialCameraPosition:
                                      controllerPage.kGooglePlex!,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    controllerPage.controller!
                                        .complete(controller);
                                  },
                                ),
                              ),
                           MaterialButton(
                             minWidth: 350,
                                  padding:const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: AppColor.black,
                                  onPressed: () {
                               controller.goToTrackingMap();
                                  },
                                  child: const Text(
                                    "Tracking",
                                    style: TextStyle(color: AppColor.white),
                                  ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
