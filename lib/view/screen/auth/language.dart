import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/route.dart';
import 'package:delivery/core/localization/changlocal.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widget/language/custtombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    // MyService myService=Get.find();
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("1".tr,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
         const SizedBox(height: 10,),
          CusttombtnLang(textlang: "Ar", onPressed: () {
            controller.changelocal("ar");
            Get.offAllNamed(AppRoute.login);
          }),
          CusttombtnLang(textlang: "En", onPressed: () {
            controller.changelocal("en");
            Get.offAllNamed(AppRoute.login);

          })
        ],),
    );
  }
}