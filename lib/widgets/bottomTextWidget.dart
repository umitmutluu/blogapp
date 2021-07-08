import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final Function onTap;
  final String text1;
  final String text2;

  const BottomTextWidget( this.onTap, this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return      GestureDetector(
      onTap: ()=>onTap,
      child: RichText(text: TextSpan(children: [
        TextSpan(text: text1, style: TextStyle(color: Colors.black)),
        TextSpan(text: " $text2", style: TextStyle(color: Colors.blue))

      ])),
    );
  }
}
