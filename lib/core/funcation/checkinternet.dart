import 'dart:async';
import 'dart:io';

 CheckInternet() async {
  try {
    var result = await InternetAddress.lookup("Google.com");
    if (result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
