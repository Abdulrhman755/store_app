import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.inputType,
  });
  final String? hintText;
  final void Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      obscureText: obscureText,
      keyboardType: inputType ?? TextInputType.text,
      onChanged: onChanged,
      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'Field cannot be empty';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.grey[100],
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
