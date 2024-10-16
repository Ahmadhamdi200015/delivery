import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';

class CusttomButtonLogin extends StatelessWidget {
  final String textbtn;
  final void Function()? onPressed;

  const CusttomButtonLogin({super.key, required this.textbtn, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed:onPressed,
      color: AppColor.black,
      child: Text(
        textbtn,
        style:const TextStyle(color: Colors.white),
      ),
    );
  }
}