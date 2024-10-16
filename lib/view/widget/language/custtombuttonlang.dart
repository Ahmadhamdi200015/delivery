import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CusttombtnLang extends StatelessWidget {
  final String textlang;
  final void Function()? onPressed;

  const CusttombtnLang({super.key, required this.textlang, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      width: double.infinity,
      child: MaterialButton(
        shape:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        color:AppColor.black,
        onPressed: onPressed,
        child: Text(
          textlang,
          style:const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
