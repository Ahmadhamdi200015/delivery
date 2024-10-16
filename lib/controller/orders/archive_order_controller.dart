
import 'package:get/get.dart';
import '../../core/constant/route.dart';
import '../../core/funcation/handlingdata.dart';
import '../../core/funcation/status_request.dart';
import '../../core/services/service.dart';
import '../../data/datasource/remote/orders/archive_data.dart';
import '../../data/model/ordersmodel.dart';

class ArchiveOrderController extends GetxController{
  ArchiveData archiveData=ArchiveData(Get.find());
  List<myOrders> ArchiveList=[];
  StatusRequest statusRequest=StatusRequest.none;
  MyService myService=Get.find();

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }


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
  String printmethodOrder(val){
    if(val.toString()=="0"){
      return "cash";
    }else{
      return "Card";
    }
  }

  String printStatusOrder(val){
    if(val.toString()=="0"){
      return "Pending Approval";
    }else{
      return "orders in a way";
    }
  }


  getOrders() async {
    statusRequest = StatusRequest.lodaing;
    update();
    var response = await archiveData.getArchive("1");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonselist=response['data'];
        ArchiveList.addAll(resonselist.map((e)=>myOrders.fromJson(e)));
       print("===============================================");
       print( resonselist[0]['orders_rating']);
        print("===============================================");

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


  refreshPage(){
    getOrders();
    update();
  }

}