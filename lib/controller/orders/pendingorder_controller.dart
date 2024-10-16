import 'dart:math';

import 'package:delivery/controller/orders/accepted_controller.dart';
import 'package:get/get.dart';
import '../../core/constant/route.dart';
import '../../core/funcation/handlingdata.dart';
import '../../core/funcation/status_request.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';



class PendingorderController extends GetxController {
  PendingData pendingData = PendingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
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
      return "The Orders is being prepared";
    } else if(val.toString()=="2"){
      return "Ready to  Picked Up By in A Delivery Man";
    }else if(val.toString()=="3"){
      return "orders in a way";
    }else{
      return "Archive";
    }
  }
  refreshPage(){
    listOrders.clear();
    getOrders();
    update();
  }

  orderApprove(myOrders myOrderModel)async{
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await pendingData.getApprove(myOrderModel.ordersId.toString(),myOrderModel.ordersUsersid.toString(),"1" );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("Approve", "Your Orders Approve");
        AcceptedController c=Get.put(AcceptedController());
        c.getOrders();
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Orders view not found ",
        );
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getOrders() async {
    listOrders.clear();
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await pendingData.getPending();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseList=response['data'];
        listOrders.addAll(responseList.map((e)=>myOrders.fromJson(e)));
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
