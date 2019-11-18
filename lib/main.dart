import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/signup.dart';
void main()=>runApp(Main());
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: LoginScreen(),
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen()
      },
    );
  }
}
