import 'package:flutter/material.dart';

import '../constants.dart';

class orginalButton extends StatelessWidget {
  orginalButton({required this.text , required this.onPressed}) ;
  final VoidCallback onPressed;
  String text ;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:  kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child:  Text(text,
        style:const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
