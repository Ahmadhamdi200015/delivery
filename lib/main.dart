import 'dart:io';

import 'package:delivery/core/localization/translation.dart';
import 'package:delivery/core/services/service.dart';
import 'package:delivery/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



import 'binding/initialbinding.dart';
import 'core/localization/changlocal.dart';
import 'firebase_options.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  }
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await InitialService();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations:Mytranslation(),
      theme:controller.appTheme,
      initialBinding: InitialBindings(),
      locale: controller.language,
      getPages:routes,

    );
  }
}

