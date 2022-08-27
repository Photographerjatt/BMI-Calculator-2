import 'package:bmi_calculator_2/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Background Box/Background_Box.dart';
import 'calculate_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


CollectionReference users = FirebaseFirestore.instance.collection('experiment');

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult,required this.resultext, required this.resultstatement});
  final String bmiResult;
  final String resultext;
  final String resultstatement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff14141f),
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
              ),
            )),
            Expanded(
                flex: 5,
                child: BackgroundBox(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(bmiResult, style: kresultpage_textstyle),
                      Text(resultext, style: kresultpage_bmivalue_style),
                      Text(
                          resultstatement,
                          textAlign: TextAlign.center,
                          style: kresultpage_message_textstyle),
                      GestureDetector(
                        onTap: () async {
                          await users.add({'Weight':bmiResult}).then((value) => print('User data Added'));
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Text('Add Data'),
                          color: Color(0xff1e1e2f),
                        ),
                      )
                    ],
                  ),
                )),
            Calculate_button(
              buttonTitle: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
