import 'package:flutter/material.dart';
import 'package:delivery/controller/orders/pendingorder_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:delivery/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../widget/orders/custtomDetails.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    PendingorderController pendingorderController =
        Get.put(PendingorderController());
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(children: [
            const Center(child:Text("PendingOrder",style: TextStyle(fontSize: 20),)),
            GetBuilder<PendingorderController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: controller.listOrders.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      elevation: 2.0,
                      color: AppColor.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Number of order : \#${controller.listOrders[index].ordersId}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    Jiffy.parse(
                                        '${controller.listOrders[index].ordersDatetime}')
                                        .fromNow(),
                                    style: const TextStyle(
                                        color: AppColor.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const Divider(),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Type Order : ${controller.printTypeOrder(controller.listOrders[index].ordersType)}"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Type payment :  ${controller.printMethodOrder(controller.listOrders[index].ordersPaymentmethod)}"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Delivery price :  ${controller.listOrders[index].ordersPricedelivery}\$"),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                  "Order Status :  ${controller.printStatusOrder(controller.listOrders[index].ordersStatus)}"),
                            ),
                            const Divider(),
                            Custtomdetails(
                              myOrdersModel: controller.listOrders[index],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ),
              ),
            )
          ],));
  }
}
