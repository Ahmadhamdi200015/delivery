import 'package:flutter/cupertino.dart';
import 'package:delivery/controller/orders/pendingorder_controller.dart';
import 'package:delivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class CusttomCardOrder extends GetView<PendingorderController>{
  final myOrders myOrdersModel;
  final String txtType;
  const CusttomCardOrder({super.key,required this.txtType,required this.myOrdersModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
          "$txtType ${myOrdersModel}"),
    );
  }
}