import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import './screens/login.dart';
import './screens/signup.dart';
void main()=>runApp(Main());
class Main extends StatelessWidget {
  _getScreen(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return HomeScreen(userId: snapshot.data.uid,);
        }
        else{
          return LoginScreen();
        }
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark// status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: IconThemeData(
          color: Colors.black
        ),
        primaryColor: Colors.blue,
        accentColor: Colors.grey
      ),
      home: _getScreen(),
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen(),
        HomeScreen.id:(context)=>HomeScreen()
      },
    );
  }
}
