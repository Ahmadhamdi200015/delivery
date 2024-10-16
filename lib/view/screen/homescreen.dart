import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../controller/homescreen_controller.dart';
import '../../core/constant/color.dart';
import '../widget/custtombottombar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar:BottomAppBar(
                color:AppColor.white,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 10,
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              CusttomBottomBar(
                                textBottom: controller.titlebottombar[0],
                                onPressed: () {
                                  controller.changePage(0);
                                },
                                active: controller.currentpage == 0 ? true : false,
                                iconBottom: Icons.home_outlined,
                              ),
                              CusttomBottomBar(
                                textBottom: controller.titlebottombar[1],
                                onPressed: () {
                                  controller.changePage(1);
                                },
                                active: controller.currentpage == 1 ? true : false,
                                iconBottom: Icons.notifications_none_outlined,
                              ),
                              CusttomBottomBar(
                                textBottom: controller.titlebottombar[2],
                                onPressed: () {
                                  controller.changePage(2);
                                },
                                active: controller.currentpage == 2 ? true : false,
                                iconBottom: Icons.settings_outlined,
                              ),
                            ],
                          ),
                        ),



                      ],
                    ),

                ),

              body: WillPopScope(
                child: Container(
                  color: AppColor.white,
                  child: controller!.listPage.elementAt(controller.currentpage),
                ),
                onWillPop: () async {
                  Get.defaultDialog(
                      title: "Warning",
                      middleText: "Do you want to exit from App",
                      onCancel: () {},
                      onConfirm: () {
                        exit(0);
                      });
                  return Future.value(false);
                },
              ),
            ));
  }
}
