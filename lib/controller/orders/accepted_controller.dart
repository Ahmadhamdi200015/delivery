import 'package:delivery/core/funcation/handlingdata.dart';
import 'package:delivery/data/datasource/remote/orders/accepted_data.dart';
import 'package:get/get.dart';

import '../../core/constant/route.dart';
import '../../core/funcation/status_request.dart';
import '../../core/services/service.dart';
import '../../data/model/ordersmodel.dart';

class AcceptedController extends GetxController{

  AcceptedData acceptedData = AcceptedData(Get.find());
  StatusRequest statusRequest = StatusRequest.lodaing;
  List<myOrders> listOrders=[];
  MyService myService=Get.find();


  String? typeorder;
  String? methodorder;
  String? addressorder;

  goToDetailsPage(myOrders myordermodel,String orderId){
    Get.toNamed(AppRoute.DetailsOrders,arguments: {
      "myorders":myordermodel,
      "orderId":myordermodel.ordersId
    });
  }

refreshPage(){
    listOrders.clear();
    getOrders();
    update();
}


  String printTypeOrder(val){
    if(val.toString()=="0"){
      return "delivery";
    }else{
      return "recive";
    }
  }
  String printMethodOrder(val){
    if(val.toString()=="0"){
      return "cash";
    }else{
      return "Card";
    }
  }

  String printStatusOrder(val){
    if(val.toString()=="0"){
      return "Pending Approval";
    }else if(val.toString()=="1"){
      return "Accepted by delivery";
    } else if(val.toString()=="2"){
      return "Picked by in a delivey";
    }else if(val.toString()=="3"){
      return "orders in a way";
    }else{
      return "Archive";
    }
  }

  getOrders() async {
    listOrders.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await acceptedData.getAccepted("1");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonselist=response['data'];
        listOrders.addAll(resonselist.map((e)=>myOrders.fromJson(e)));
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Orders view not found ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  orderDone(myOrders myOrderModel)async{
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await acceptedData.getDone(myOrderModel.ordersId.toString(),myOrderModel.ordersUsersid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Order Done", "Your Orders Done");
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Orders view not found ",
        );
      }
    } else {
      print("==========================failure");
      statusRequest = StatusRequest.failure;
    }
    update();
  }


  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

}