import 'package:delivery/view/screen/orders/archiveorders.dart';
import 'package:delivery/view/screen/orders/pendingorders.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/route.dart';

import 'package:get/get.dart';

import '../view/screen/orders/acceptOrder.dart';

abstract class HomeScreenController extends GetxController {

  changePage(int i);
}
 class HomeScreenControllerImp extends HomeScreenController{
    int currentpage=0;

  List<Widget> listPage=const[
    PendingOrders(),
    Acceptorder(),
    Archiveorders(),
  ];

  List<String> titlebottombar=const[
    "Pending",
    "Accepted",
    "Archive",
  ];
  @override
  changePage(int i) {
    currentpage=i;
    update();

  }





 }