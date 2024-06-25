
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3E69FE)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        )
      ),
      child: Text(text, style: const TextStyle(fontSize: 16),),
    );
  }

}