import 'package:bmi_calculator_2/screens/login_screen.dart';
import 'package:bmi_calculator_2/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff1e1e2f),
      ),
      //Input Page Contains the Scaffold
      initialRoute: InputPage.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        InputPage.id: (context) => InputPage(),
      },
    );
  }
}

