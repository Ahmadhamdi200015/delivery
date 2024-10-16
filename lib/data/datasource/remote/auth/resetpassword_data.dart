import '../../../../applink.dart';
import '../../../../core/class/crud.dart';
class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postData(String email,String password,) async {
    var payload = {
      "password": password,
      "email": email,

    };
    var response = await crud.dataPost(AppLink.resetpassword, payload);
    return response.fold((l) => l, (r) => r);
  }
}
