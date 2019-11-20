import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone_flutter/screens/signup.dart';
import 'package:instagram_clone_flutter/services/auth_services.dart';
class LoginScreen extends StatefulWidget {
  static final id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  String _email,_password;
  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_password);
     AuthServices.signIn(context, _email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark// status bar color
    ));
    return SafeArea(
      child:Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Instagram",style: TextStyle(
                fontSize: 50,
                fontFamily: 'Billabong',
                letterSpacing: 1
              ),),
                 Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                      child: TextFormField(
                        decoration:InputDecoration(
                          labelText: "Email"
                        ),
                        validator: (input)=> !input.contains("@")?"Please enter a valid email":null,
                        onSaved: (input)=>_email=input,
                      ),
                    ),Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                        child: TextFormField(
                          decoration:InputDecoration(
                              labelText: "Password"
                          ),
                          validator: (input)=> (input.length<6)?"Password must be of 6 letters":null,
                          onSaved: (input)=>_password=input,
                          obscureText: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: _submit,
                        child: Padding(
                          padding: const EdgeInsets.only(top:50),
                          child: Container(
                            width: 250,
                            alignment: Alignment.center,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:()=> Navigator.pushNamed(context, SignUpScreen.id),
                        child: Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: Container(
                            width: 250,
                            alignment: Alignment.center,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                  ),
                ),
            ],
          ),
        ),
      )
    );
  }
}
