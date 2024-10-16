import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class AddressData {
  final Crud crud;

  AddressData(this.crud);

  Future<dynamic> addAddress(
    String userid,
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.dataPost(AppLink.AddAdress, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }

  Future<dynamic> getAddress(
    String userid,
  ) async {
    var response = await crud.dataPost(AppLink.viewAddress, {
      "userid": userid,
    });
    return response.fold(
        (l) => l, // Handle the left side of the result (typically an error)
        (r) => r // Handle the right side of the result (typically the data)
        );
  }


  Future<dynamic> removeAddress(
      String addressid,
      ) async {
    var response = await crud.dataPost(AppLink.removeAddress, {
      "addressid": addressid,
    });
    return response.fold(
            (l) => l, // Handle the left side of the result (typically an error)
            (r) => r // Handle the right side of the result (typically the data)
    );
  }
}
