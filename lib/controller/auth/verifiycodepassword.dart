import 'package:delivery/core/constant/route.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class VerifiyCodePassword extends GetxController{
  GoToSuccessPassword();
}

class VerifiyCodePasswordImp extends VerifiyCodePassword{
   String? verificationCode;
  @override
  GoToSuccessPassword() {
      Get.offAllNamed(AppRoute.SuccessCheckPassword);

    // Get.offAllNamed(AppRoute.ResetPassword);
  }

}