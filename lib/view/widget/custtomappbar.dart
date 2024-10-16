import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/route.dart';

class CusttomAppBar extends StatelessWidget {
  final TextEditingController? myController;
  final void  Function(String)? onChanged;
  final void Function()? onPressedSearch;
   CusttomAppBar({super.key, required this.myController, this.onChanged,required this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
              controller:myController,
              onChanged:onChanged,
          style:const TextStyle(fontFamily: "sans", color: AppColor.black),
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.greysecond,
              prefixIcon: IconButton(onPressed:onPressedSearch, icon:Icon(Icons.search)),
              hintText: "Find product",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              )),
        )),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.greysecond),
          child: IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.FavouritePage);
            },
            icon: Icon(
              Icons.favorite,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
