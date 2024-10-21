import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';

class CusttomButtonController extends GetView<OnboardingControllerimp> {
  const CusttomButtonController({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: MaterialButton(
        padding:const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
        onPressed: () {
          controller.next();
        },
        color: Colors.black,
        child: Text(
          "8".tr,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
