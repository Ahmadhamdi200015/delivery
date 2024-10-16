import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:flutter/material.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class AcceptCardOrder extends GetView<AcceptedController> {
  final myOrders myOrdersModel;

  const AcceptCardOrder({super.key, required this.myOrdersModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(
          "TotalPrice: ${myOrdersModel.ordersTotalprice}\$",
          style:const TextStyle(
              color: AppColor.primaryColor, fontWeight: FontWeight.bold),
        ),),
        const Spacer(),

        if (myOrdersModel.ordersStatus.toString() == "3")
          Expanded(child:  MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColor.black,
            onPressed: () {
              controller.orderDone(myOrdersModel);
              controller.refreshPage();
            },
            child: const Text(
              "Done",
              style: TextStyle(color: AppColor.white),
            ),
          ),),
        const  SizedBox(
          width: 5,
        ),
        Expanded(child:  MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.black,
          onPressed: () {
            controller.goToDetailsPage(
                myOrdersModel, myOrdersModel.ordersId.toString());
          },
          child: const Text(
            "Details",
            style: TextStyle(color: AppColor.white),
          ),
        ),)
      ],
    );
  }
}
