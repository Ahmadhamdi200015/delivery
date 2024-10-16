import 'package:delivery/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish=ThemeData(
  fontFamily:"Sans",
  textTheme: const TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      bodyMedium: TextStyle(fontSize: 15),
      bodySmall: TextStyle(fontSize: 15, color: AppColor.grey),
      headlineSmall: TextStyle(fontSize: 13, color: AppColor.grey),
      headlineMedium: TextStyle(fontSize: 20, color: AppColor.black,fontWeight:FontWeight.bold),
      headlineLarge: TextStyle(
          fontSize: 20,
          color: AppColor.grey)),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);


ThemeData themeArabic=ThemeData(
  fontFamily:"Cairo",
  textTheme: const TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      bodyMedium: TextStyle(fontSize: 15),
      bodySmall: TextStyle(fontSize: 15, color: AppColor.grey),
      headlineSmall: TextStyle(fontSize: 13, color: AppColor.grey),
      headlineMedium: TextStyle(fontSize: 20, color: AppColor.black,fontWeight:FontWeight.bold),
      headlineLarge: TextStyle(
          fontSize: 20,
          color: AppColor.grey)),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
