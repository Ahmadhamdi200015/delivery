import 'package:flutter/cupertino.dart';

class CusttomTitle extends StatelessWidget{
  final String textTitle;
  const CusttomTitle({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 10),
      child: Text(
        textTitle,
        textAlign: TextAlign.center,
        style:const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
      ),
    );
  }
}