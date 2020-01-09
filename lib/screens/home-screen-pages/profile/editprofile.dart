import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/usermodel.dart';
class EditProfile extends StatefulWidget {
   User user;
   EditProfile(this.user);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _formkey=GlobalKey<FormState>();
  String _name=widget.user.name;
  String _bio=widget.user.bio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text("Profile",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1053055123193122816/IUwo6l_Q_400x400.jpg'),
                    ),
                    TextFormField(
                      initialValue: ,
                    )
                  ],
                ),
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
