import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class AddProductButton extends StatelessWidget {
  final bool isLoading;
  final Function()? onTap;
  final String text;
  const AddProductButton({super.key, this.onTap, this.isLoading = false, required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
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
