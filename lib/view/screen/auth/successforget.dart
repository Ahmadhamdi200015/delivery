import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/route.dart';
import 'package:delivery/view/widget/auth/custtomButtonLogin.dart';
import 'package:get/get.dart';

class SuccessForget extends StatelessWidget {
  const SuccessForget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Success Check Verification",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: AppColor.primaryColor,
              ),
              Text(
                "Success Check Verification",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "we will send you to login page",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: double.infinity,
                child: CusttomButtonLogin(
                  textbtn: "Login",
                  onPressed: () {
                    Get.offAllNamed(AppRoute.HomeScreen);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
