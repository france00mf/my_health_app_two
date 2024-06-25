import 'package:flutter/material.dart';

class RecendCodeButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const RecendCodeButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text),
      onPressed: onPressed,
    );
  }
}