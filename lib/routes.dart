import 'package:delivery/core/middleware/mymiddleware.dart';
import 'package:delivery/core/middleware/myusermiddleware.dart';
import 'package:delivery/view/screen/auth/forgetpassword.dart';
import 'package:delivery/view/screen/auth/language.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/successforget.dart';
import 'package:delivery/view/screen/auth/verifiycode.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/orders/archiveorders.dart';
import 'package:delivery/view/screen/orders/detailsorder.dart';
import 'package:delivery/view/screen/orders/pendingorders.dart';
import 'package:delivery/view/screen/orders/trackingmap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/route.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [
  //       MyMiddleware()
  // ]),


   GetPage(name:"/", page: () => const HomeScreen()),


  GetPage(name: AppRoute.login, page: () => const Login()),
  // GetPage(name: AppRoute.onBoarding, page: () => const Onboarding()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VerifiyCode, page: () => const Verifiycode()),
  GetPage(
      name: AppRoute.SuccessCheckPassword, page: () => const SuccessForget()),


  GetPage(name: AppRoute.TrackingMap, page: () => const TrackingMap()),

  GetPage(name: AppRoute.PendingOrders, page: () => const PendingOrders()),

  GetPage(name: AppRoute.DetailsOrders, page: () => const DetailsOrder()),
  GetPage(name: AppRoute.Archiveorders, page: () => const Archiveorders()),









];
