import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/core/constant/color.dart';

class CusttomTextSign extends StatelessWidget{
  final String textOne;
  final String textTow;
  final void Function()? onTap ;
  const CusttomTextSign({super.key, required this.textOne, required this.textTow, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne,style: Theme.of(context).textTheme.bodyMedium,),
        InkWell(
          onTap:onTap ,
            child: Text(
              textTow,
              style:const TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}