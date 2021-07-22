import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class BottomTextWidget extends StatelessWidget {
  final Callback onTap;
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
