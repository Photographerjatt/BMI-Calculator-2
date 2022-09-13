import 'package:flutter/material.dart';
import '../Background Box/Background_Box.dart';
import '../History_box_inputPage.dart';
import '../constants.dart';
import 'result_page.dart';
import '../calculate_button.dart';
import '../bmi_calculation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bmi_calculator_2/screens/slideout.dart';
import 'package:bmi_calculator_2/Background Box/widgets.dart';
import 'package:bmi_calculator_2/screens/profile.dart';

//This Page Contains the Scaffold
class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  int height=180;
  int weight=60;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff14141f),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return NavDrawer();
            }));
          },
          child: Icon(
            Icons.list,
          ),
        ),
        title: FitText("BMI Calculator", 20, Colors.white, FontWeight.bold, 1),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              getProfile(context);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: width/20,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //This Box Contains History
          History_box(),
          //This Box Contains weight adjusting variable
          Expanded(
            child: BackgroundBox(
              //cardchild is to pass a widget to class
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height',style: ksliderbox_textstyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),style: ksliderbox_numstyle,),
                      Text('cm',style: TextStyle(fontSize: 25),),
                    ],
                  ),
                  Slider(value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.pink[400],
                    inactiveColor: Colors.pink[100],
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      },);
                    },)
                ],
              ),
            ),
          ),
          //This Box Contains height adjusting variable
          Expanded(
            child: BackgroundBox(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Weight',style: ksliderbox_textstyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(weight.toString(),style: ksliderbox_numstyle,),
                      Text('kg',style: TextStyle(fontSize: 25),),
                    ],
                  ),
                  Slider(value: weight.toDouble(),
                    min: 30,
                    max: 150,
                    activeColor: Colors.pink[400],
                    inactiveColor: Colors.pink[100],
                    onChanged: (double newValue){
                      setState(() {
                        weight=newValue.round();
                      });
                    },)
                ],
              ),
            ),
          ),

          //It contains the box for calculation button
          Calculate_button(
            buttonTitle: 'Calculate',
            onTap: () {
              BMI_Calculation calc=BMI_Calculation(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                bmiResult: calc.calculate_BMI(),
                resultext: calc.getResult(),
                resultstatement: calc.getStatement(),
              )));
            },
          ),
        ],
      ),
    );
  }
}








