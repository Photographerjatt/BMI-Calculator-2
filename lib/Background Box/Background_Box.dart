import 'package:flutter/material.dart';
import '../constants.dart';
//This is the common which we created for repeated background box/container
class BackgroundBox extends StatelessWidget {
  BackgroundBox({this.cardChild});
  @override
  final Widget ? cardChild;

  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: background_box_color,
            borderRadius: BorderRadius.circular(10.0)));
  }
}