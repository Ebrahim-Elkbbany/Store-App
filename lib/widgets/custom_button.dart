import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.buttonName,
    this.onTap,
    this.boxDecorationColor,
    this.textColor,
  });
  String? buttonName;
  VoidCallback? onTap;
  Color? boxDecorationColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: boxDecorationColor,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
