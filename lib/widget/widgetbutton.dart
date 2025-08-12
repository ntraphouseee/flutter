import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String textt;
  final Color textColor;
  final Color color;
  final VoidCallback press;

  const CustomButton({
    super.key,
    required this.textColor,
    required this.textt,
    required this.press,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(textt, style: TextStyle(color: textColor)),
    );
  }
}
