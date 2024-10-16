

import '../../../../applink.dart';
import '../../../../core/class/crud.dart';

class LoginData {
  final Crud crud;

  LoginData(this.crud);

  Future postData(String email, String password) async {

    // Construct the request payload
    var payload = {
      "email": email.toString(),
      "password": password.toString(),
    };

    // Make the POST request
    var response = await crud.dataPost(AppLink.login, payload);

    // Handle the response based on result type
    return response.fold(
            (l) => l, // Handle error
            (r) => r  // Handle success
    );

  }
}
