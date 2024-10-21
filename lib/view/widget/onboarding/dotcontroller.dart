import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/static/static.dart';

class dotController extends GetView<OnboardingControllerimp> {
  const dotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerimp>(
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onboardinglist.length,
              (index) => AnimatedContainer(
                    margin:const EdgeInsets.only(right: 5),
                    duration:const Duration(milliseconds: 600),
                    width: controller.currentpage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
        ],
      ),
    );
  }
}
