import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const history_box_icon=FontAwesomeIcons.fileWaveform;

//This box which contains decoration for history box
class History_box extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 10),
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: Color(0xff28283e),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
        onTap: (){
          print('History is Pressed');
        },
        child: History_row(),
      ),
    );
  }
}

class History_row extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          history_box_icon,
          size: 40.0,
        ),
        SizedBox(
          width: 10,
        ),
        Text('History',style: TextStyle(
          fontSize: 30.0,fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}
