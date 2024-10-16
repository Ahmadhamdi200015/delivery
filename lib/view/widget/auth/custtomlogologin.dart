import 'package:flutter/cupertino.dart';
import 'package:delivery/core/constant/color.dart';
import 'package:delivery/core/constant/imageasset.dart';

class CusttomLogoLogin extends StatelessWidget{
  const CusttomLogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(bottom: 40),
        width: 100,
        height: 100,
        child: Image.asset(Imageasset.logo,color: AppColor.black,));
  }
}