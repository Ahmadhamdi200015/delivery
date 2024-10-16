import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:delivery/controller/auth/auth_controller.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/funcation/alertexitapp.dart';
import 'package:delivery/core/funcation/validinput.dart';
import 'package:delivery/view/widget/auth/custtomButtonLogin.dart';
import 'package:delivery/view/widget/auth/custtomTextFormSign.dart';
import 'package:delivery/view/widget/auth/custtomTextSign.dart';
import 'package:delivery/view/widget/auth/custtomlogologin.dart';
import 'package:delivery/view/widget/auth/custtomtextwelcome.dart';
import 'package:delivery/view/widget/auth/handlingdataview.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "9".tr,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: WillPopScope(
        onWillPop: () {
          return AlertExitApp();
        },
        child: Container(
            margin:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.center,
            child: GetBuilder<LoginControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.stateRequest,
                      widget: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                            const CusttomLogoLogin(),
                            CusttomTextWelcome(textWelcome: "11".tr),
                            CusttomTextFormSign(
                              valid: (val) {
                                return validInput(val!, 11, 50, "email");
                              },
                              myController: controller.email!,
                              hintText: "12".tr,
                              labelText: "18".tr,
                              iconData: (Icons.email_outlined),
                            ),
                            CusttomTextFormSign(
                              valid: (val) {
                                return validInput(val!, 8, 30, "password");
                              },
                              myController: controller.password!,
                              hintText: "13".tr,
                              labelText: "19".tr,
                              iconData: (Icons.lock_outline),
                            ),
                            const SizedBox(height: 20,),
                            CusttomButtonLogin(
                              onPressed: () {
                                controller.Login();
                              },
                              textbtn: "15".tr,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                controller.GoToForgetPassword();
                              },
                              child: Text(
                                "14".tr,
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            CusttomTextSign(
                              textOne: "16".tr,
                              textTow: "17".tr,
                              onTap: () {
                                controller.GoToSign();
                              },
                            )
                          ],
                        ),
                      ),
                    ))),
      ),
    );
  }
}
