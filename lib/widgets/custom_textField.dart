import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.inputType,
  });
  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
       keyboardType:inputType ,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
