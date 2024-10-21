import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding_controller.dart';
import '../widget/onboarding/buttoncontroller.dart';
import '../widget/onboarding/custtomslide.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoardingPage extends GetView<OnboardingControllerimp> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerimp());
    return const Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Column(
        children: [
          Expanded(flex: 3, child: CusstomSlideOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  dotController(),
                  SizedBox(
                    height: 40,
                  ),
                  CusttomButtonController(),
                ],
              ))
        ],
      ),
    ));
  }
}
