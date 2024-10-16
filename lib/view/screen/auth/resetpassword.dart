import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/controller/auth/resetpassword_controller.dart';
import 'package:delivery/core/funcation/validinput.dart';
import 'package:delivery/view/widget/auth/custtomButtonLogin.dart';
import 'package:delivery/view/widget/auth/custtomTextFormSign.dart';
import 'package:delivery/view/widget/auth/custtomTitle.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New Password",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0.0,
      ),
      body:GetBuilder<ResetPasswordControllerImp>(builder: (controller){
        return  Container(
          margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const CusttomTitle(textTitle: "New Password"),
                CusttomTextFormSign(
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    hintText: "New Password",
                    labelText: "Password",
                    iconData: Icons.lock_outline,
                    myController: controller.password),
                CusttomTextFormSign(
                    valid: (val) {
                      return validInput(val!, 8, 30, "password");
                    },
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    iconData: Icons.lock_outline,
                    myController: controller.repassword),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: CusttomButtonLogin(
                    textbtn: "Reset",
                    onPressed: () {
                      controller.GoToSuccessPassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },)
    );
  }
}
