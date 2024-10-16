import 'package:delivery/core/constant/route.dart';
import 'package:delivery/core/funcation/status_request.dart';
import 'package:delivery/core/services/service.dart';
import 'package:delivery/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/funcation/handlingdata.dart';

abstract class AuthController extends GetxController {
  Login();

  GoToSign();

  GoToForgetPassword();
}

class LoginControllerImp extends AuthController {
  Map data={};
  MyService myService=Get.find();
  GlobalKey<FormState> formState = GlobalKey();
   TextEditingController? email;
   TextEditingController? password;
  LoginData loginData = LoginData(Get.find());
  StatusRequest stateRequest=StatusRequest.none;
  @override
  Login() async{
    if (formState.currentState!.validate()) {
      stateRequest = StatusRequest.lodaing;
      update();
      print("========================alilogi");
      try {
        var response = await loginData.postData(
            email!.text,
          password!.text
        );
        print("========================alires");
        stateRequest = handlingData(response);
        if (StatusRequest.success == stateRequest) {
          print("========================ali3s");
          if (response['status'] == "success") {
            print("============================= success");
            await Get.offAllNamed(AppRoute.HomeScreen);
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email or phone mistake ",
            );
          }
        } else {
          stateRequest = StatusRequest.failure;
        }
      } catch (e) {
        stateRequest = StatusRequest.failure;
        print('Login error: $e');
        Get.defaultDialog(
          title: "Error",
          middleText: "An unexpected error occurred.",
        );
      }
      update();

    }
  }


  @override
  GoToSign() {
    Get.offAllNamed(AppRoute.Sign);
  }

  @override
  GoToForgetPassword() {
    Get.offAllNamed(AppRoute.ForgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }


}
