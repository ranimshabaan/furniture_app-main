import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function(String) onChanged;
  bool obscuretext;
  

   CustomTextWidget(
      {super.key, required this.icon,
      required this.text,
      required this.color,
      required this.onChanged
      ,required this.obscuretext });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: body_might_complete_normally_nullable
      validator: (data) {
        if (data!.isEmpty) 
          return ('field required');
      },
  
      obscureText:obscuretext ,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
