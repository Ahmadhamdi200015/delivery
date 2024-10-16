import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

// class NotificationsHelper {
//   // creat instance of fbm
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   // initialize notifications for this app or device
//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     // get device token
//     String? deviceToken = await _firebaseMessaging.getToken();
//     // DeviceToken = deviceToken;
//     print(
//         "===================Device FirebaseMessaging Token====================");
//     print(deviceToken);
//     print(
//         "===================Device FirebaseMessaging Token====================");
//   }
//
//   // handle notifications when received
//   void handleMessages(RemoteMessage? message) {
//     if (message != null) {
//       // navigatorKey.currentState?.pushNamed(NotificationsScreen.routeName, arguments: message);
//       Get.snackbar('on Background Message notification',"Success");
//     }
//   }
//
//   // handel notifications in case app is terminated
//   void handleBackgroundNotifications() async {
//     FirebaseMessaging.instance.getInitialMessage().then((handleMessages));
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
//   }
//
//   Future<String?> getAccessToken() async {
//     final serviceAccountJson = {
//       "type": "service_account",
//       "project_id": "mystore-3b6f5",
//       "private_key_id": "dfba23795d054de5398c6d38c412321280b61f4b",
//       "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzyT9wEM//kePz\ndJ5j/7U7MbK/Jui6A/VyLVvwo/i7Z3NUay9O8XMBe/xs7yLHpKbEMqn6Y2arX3AA\nnEbewJ0KiWtqgkp0ytHSi0beb0VUrvdvA9esEWhYq0wnSYzAlqBBZmVcJzWO/OUg\nwbks8GcuNHu8ftMQwHRAryya9WSK7TwmxGsKXgRziHYjTGjVA3cxptOqIENMTq9O\nL6jq7IWgZsfjB8H/iTTBhRlXm17TJwXFcfpH61Vm+hxI+FQgoQcYLwzbsINSERsa\nmJ8I4oiQ6mYrOdQ3KmIsDQARlMNoSBjpCANB0bxM129hEVqG+RQcjGe3AqdQklHG\nv+3mE/ANAgMBAAECggEADOUPyD1kdbukglcobxqtiHfZjq0/Puw+w/gt4nYYRnS2\niGUBqSNXMNGQOs3yDCiqj2Lk3yEXAY6gTWLoEFz3RoSxsBt1NKhBYVz88cJAUkEU\nXSGE7AH5nnZ2yVCUqFGFX/t0pKXpSP6pfm52lhsOA3nfMBdWkxqCnAsUY27bTb10\nZNCUpZ2L8AtErwjJjXJc5Kb+ZM4aVB/+DsgepCu3yaff7WSBIqsocvbXCAHTPbRc\n9sGLJ1H8vCnQstomWeh9dmARz+pajJ9HP5e2uDGiSpbPnsefRVLxRfsre0m51+lM\niqolv7lxojZcQcf/gSFGNrwcFwvcqIqHBFN6Q4gBnwKBgQDh1/mTgtqdC/YN3TPm\nPJ9xw6zW2BV2ZjXOorOV9rM7tCCTPOGC2gonrHQI6Uj5WYsOxucsue90Hl2w0ALk\nOC5gGJGq5I+zjnPUyxY3c+FGGtUfyS9ROuXcXpoBn74ZqJ6FeOMdbKHGlhRkvv0u\nvWCwWC9QbEzcMKIOBt2V8hubPwKBgQDLyuLVqr1nQ3PCh1DftopKKQGVIp6MnvOy\neI2BlA0RUPdW+RJrvd2lTDihm8dJQw9Al/ZKCR2P2rQQYAztMgIBDyl6Cdqqg2Ku\nJmR16SFBy6o+wNjB8l8DZZDCdO57sX6UnGljiejy35Tp5MEE0A+ktnxAwaGTqQKP\nkaxW3P/dswKBgQCBIHpbRAL4riEWFjaZWmoToryM7ml/E7uKFO63PKGH7lp9tN5/\ncWlC+9AwVCncH71pSoJcyUbGzqHk+Vnd4N1rJkELQ7mCAV3q+d8O/5t6+NaIYQBD\n4ngQgqptaUdI5mcUi2TXqwfoQmEQpT6fXboNua37vqBHeSr++B/znsT4AwKBgC0h\n546OW5fs9kwUj7KbyJCX+EPBAP//i9TwodYapbI6DizyyEOYLugWs0wHJeFxuoUB\noofO8P8U3l/qBbLaKlt1sifW2th8dHRBCGqckMLzieaP6vE47hXgfmiyYMaADpp2\n8VgcCL0RCveps52PPoep6mak+1WqTmjhSBuMohXFAoGATiBjBHnScF/MEXbG3O+2\njFPBiC9rnEdSNc8+NIMDntxZ43DU8AK9AiaEAxtEtlo2kaIy+J4bbwS9lof+u36Z\nCGEeKMqpvqwER/sNQ0SWBcHAxByC+ZwGIXvGTn9YDe72be6Dh+ZV9N53JoRQArNo\nJAF0u9TWMAlcUU74hlLm4YQ=\n-----END PRIVATE KEY-----\n",
//       "client_email": "firebase-adminsdk-p5he6@mystore-3b6f5.iam.gserviceaccount.com",
//       "client_id": "106817528735068090152",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-p5he6%40mystore-3b6f5.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };
//
//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];
//
//     try {
//       http.Client client = await auth.clientViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);
//
//       auth.AccessCredentials credentials =
//       await auth.obtainAccessCredentialsViaServiceAccount(
//           auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//           scopes,
//           client);
//
//       client.close();
//       print("======================");
//       print(
//           "Access Token: ${credentials.accessToken.data}");
//       print("=============================");// Print Access Token
//       return credentials.accessToken.data;
//     } catch (e) {
//       print("Error getting access token: $e");
//       return null;
//     }
//   }
//
//   Map<String, dynamic> getBody({
//     required String fcmToken,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) {
//     return {
//       "message": {
//         "token": fcmToken,
//         "notification": {"title": title, "body": body},
//         "android": {
//           "notification": {
//             "notification_priority": "PRIORITY_MAX",
//             "sound": "default"
//           }
//         },
//         "apns": {
//           "payload": {
//             "aps": {"content_available": true}
//           }
//         },
//         "data": {
//           "type": type,
//           "id": userId,
//           "click_action": "FLUTTER_NOTIFICATION_CLICK"
//         }
//       }
//     };
//   }
//
//   Future<void> sendNotifications({
//     required String fcmToken,
//     required String title,
//     required String body,
//     required String userId,
//     String? type,
//   }) async {
//     try {
//       var serverKeyAuthorization = await getAccessToken();
//
//       // change your project id
//       const String urlEndPoint =
//           "https://fcm.googleapis.com/v1/projects/mystore-3b6f5/messages:send";
//
//       Dio dio = Dio();
//       dio.options.headers['Content-Type'] = 'application/json';
//       dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';
//       print('Bearer $serverKeyAuthorization');
//
//       var response = await dio.post(
//         urlEndPoint,
//         data: getBody(
//           userId: userId,
//           fcmToken: fcmToken,
//           title: title,
//           body: body,
//           type: type ?? "message",
//         ),
//       );
//
//       // Print response status code and body for debugging
//       print('Response Status Code: ${response.statusCode}');
//       print('Response Data: ${response.data}');
//     } catch (e) {
//       print("Error sending notification: $e");
//     }
//   }
// }
