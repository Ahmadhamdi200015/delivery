import 'package:delivery/core/constant/route.dart';
import 'package:delivery/core/funcation/handlingdata.dart';
import 'package:delivery/core/funcation/status_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/datasource/remote/auth/checkemail_data.dart';

abstract class ForgetPasswordController extends GetxController {
  CheackEmail();

}

class ForgetpasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  StatusRequest? stateRequest;
  CheckEmailData checkEmailData=CheckEmailData(Get.find());

  @override
  CheackEmail()async {
    if(formState.currentState!.validate()){
      stateRequest = StatusRequest.lodaing;
      try {
        var response = await checkEmailData.postData(
          email.text,
        );
        stateRequest = handlingData(response);
        if (StatusRequest.success == stateRequest) {
          if (response['status'] == "success") {
            print("============================= success");
            return Get.offAllNamed(AppRoute.ResetPassword,arguments: {
              "email":email.text,
            });
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email not found ",
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
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
