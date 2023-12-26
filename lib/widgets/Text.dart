import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight? bold;
  final double? fontSize;

  const CustomText( this.text,{super.key,  this.bold ,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: KprimaryColor,
        fontWeight: bold,
        fontSize: fontSize ??  14,
      ),
    );
  }
}
