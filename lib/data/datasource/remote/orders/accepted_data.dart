import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class AcceptedData {
  final Crud crud;

  AcceptedData(this.crud);

  Future<dynamic> getAccepted(String deliveryId) async {
    var response = await crud.dataPost(AppLink.acceptedOrder,{
      "id":deliveryId.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

  Future<dynamic> getDone(String orderId,String userId) async {
    var response = await crud.dataPost(AppLink.doneOrder,{
      "ordersid":orderId.toString(),
      "usersid":userId.toString()
    });
    return response.fold(
            (l) => l,  // Handle the left side of the result (typically an error)
            (r) => r   // Handle the right side of the result (typically the data)
    );
  }

}