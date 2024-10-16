
import 'package:delivery/core/funcation/handlingdata.dart';
import 'package:delivery/core/services/service.dart';
import 'package:delivery/data/datasource/remote/address_data.dart';
import 'package:delivery/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/funcation/status_request.dart';

abstract class AddressViewController extends GetxController {
  GoToAddAdress();

  getAddress();

  removeAddress(String addressId);
}

class AddressViewControllerImp extends AddressViewController {
  List<MyAddressModel> data = [];

  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService=Get.find();

  @override
  void onInit() {
    print("ahmad=====================");
    getAddress();
    super.onInit();
  }

  GoToAddAdress() {
    Get.toNamed(AppRoute.MapAddressPage);
  }

  getAddress() async {
    data.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await addressData.getAddress(
      "${myService.sharedPrefrences.getString("userid")}",
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responselist = response['data'];
        data.addAll(responselist.map((e) => MyAddressModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  removeAddress(addressId) async {
      var response = await addressData.removeAddress(addressId.toString());
            data.removeWhere(
              (e) => e.AddressId.toString() == addressId.toString());
    update();
  }
  @override
  void dispose() {
    super.dispose();
  }
}
