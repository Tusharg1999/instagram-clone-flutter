import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final id='signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey=GlobalKey<FormState>();
  String _email,_password;
  _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }
  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        child: TextFormField(
                          decoration:InputDecoration(
                              labelText: "Email"
                          ),
                          validator: (input)=> !input.contains("@")?"Please enter a valid email":null,
                          onSaved: (input)=>_email=input,
                        ),
                      ),Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
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
