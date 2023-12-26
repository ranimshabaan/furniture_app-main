import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
 final VoidCallback? onTap ;
  

  const CustomButton({super.key, required this.text , this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
