import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback? onPressed; // biar tombol bisa diklik

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // tombol aktif kalau ada fungsi
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
