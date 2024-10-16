import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusttomTextWelcome extends StatelessWidget {
  final String textWelcome;

  const CusttomTextWelcome({super.key, required this.textWelcome});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 60),
      child: Text(
        textWelcome,
        textAlign: TextAlign.center,
        style:Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
