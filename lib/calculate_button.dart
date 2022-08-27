import 'package:flutter/material.dart';
import 'constants.dart';

//This is the class define for Caculate button
class Calculate_button extends StatelessWidget {
  Calculate_button({this.onTap,required this.buttonTitle});
  final VoidCallback ? onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: kcalculatebutton_style),),
        margin: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 20),
        width: double.infinity,
        height: calculate_box_height,
        decoration: BoxDecoration(
          color: Colors.pink[400],
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
  }
}