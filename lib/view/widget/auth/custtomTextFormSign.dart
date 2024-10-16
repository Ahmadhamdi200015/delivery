import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';

class CusttomTextFormSign extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?) valid;

  const CusttomTextFormSign(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.iconData, required this.myController, required this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator:valid,
        controller: myController,
        decoration: InputDecoration(
          suffixIcon: Icon(iconData),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(labelText),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(fontSize: 14, color: AppColor.grey),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: AppColor.grey),
        ),
      ),
    );
  }
}
