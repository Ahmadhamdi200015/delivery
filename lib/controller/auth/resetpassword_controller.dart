import 'package:delivery/core/funcation/status_request.dart';
import 'package:delivery/data/datasource/remote/auth/resetpassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/funcation/handlingdata.dart';

abstract class ResetPasswordController extends GetxController {
  GoToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;
  StatusRequest? stateRequest;
  String? email;

  @override
  GoToSuccessPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Worning", middleText: "password and repassword not match");
    }
      if (formState.currentState!.validate()) {
        stateRequest = StatusRequest.lodaing;
        // try {
          var response = await resetPasswordData.postData(email!,
              password.text
          );
          stateRequest = handlingData(response);
          if (StatusRequest.success == stateRequest) {
            if (response['status'] == "success") {
              print("============================= success");
              return Get.offAllNamed(AppRoute.SuccessCheckPassword);
            }
          } else {
            stateRequest = StatusRequest.failure;
          }
        // } catch (e) {
        //   stateRequest = StatusRequest.failure;
        //   print('Login error: $e');
        //   Get.defaultDialog(
        //     title: "Error",
        //     middleText: "An unexpected error occurred.",
        //   );
        // }
      }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
