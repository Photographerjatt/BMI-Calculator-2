import 'package:bmi_calculator_2/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bmi_calculator_2/controller/firebase_service.dart';
import 'package:bmi_calculator_2/Background Box/widgets.dart';

final User? user = FirebaseAuth.instance.currentUser;

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return (user!=null)? InputPage():
    GoogleScreen();
  }
}

class GoogleScreen extends StatelessWidget {
  const GoogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [

            //upper container
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //1
                    Image(
                      image: AssetImage('image/playstore.png'),
                      height: height/3,
                    ),

                    //2
                    FitText("BMI Calculator", 40, Colors.white, FontWeight.bold, 0),

                    SizedBox(
                      height: height/68,
                    ),

                    //3
                    FitText("Calculate your BMI", 20, Colors.grey, FontWeight.normal,0),



                  ],
                ),
              ),
            ),


            //2 lower container
            Container(
              padding: EdgeInsets.symmetric(horizontal: width/15,vertical:height/25,),
              child: Column(
                children: [
                  //1
                  ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //1
                        Image(
                          image: AssetImage('image/google.png'),
                          height: height/25,
                        ),

                        //2
                        SizedBox(
                          width: width/20,
                        ),

                        //3
                        FitText("Sign In",25,Colors.white,FontWeight.bold,0),
                      ],
                    ),
                    onPressed: () async {
                      if(user == null){
                        FirebaseService service = new FirebaseService();
                        try {

                          await service.signInwithGoogle();

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));

                        } catch(e){
                          if(e is FirebaseAuthException){
                            print(e);
                          }
                        }
                      }
                      else{

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InputPage()));

                      }


                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(width/40)
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}