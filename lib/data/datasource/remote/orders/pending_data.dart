import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class PendingData {
  final Crud crud;

  PendingData(this.crud);

  Future<dynamic> getPending() async {
    var response = await crud.dataPost(AppLink.pendingOrder, {});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> getApprove(
      String orderId, String userId, String deliveyId) async {
    var response = await crud.dataPost(AppLink.approveOrder,
        {"ordersid": orderId, "usersid": userId, "deliveryid": deliveyId});
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }
}
