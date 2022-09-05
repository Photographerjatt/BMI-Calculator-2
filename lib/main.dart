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
      home: InputPage(),
    );
  }
}

