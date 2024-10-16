import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do You want exit app ",
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("Confirm")),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        )
      ]);
  return Future.value(true);
}
