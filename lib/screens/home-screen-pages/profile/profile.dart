import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screens/home-screen-pages/profile/editprofile.dart';
import '../../../utility/userutility.dart';
import '../../../models/usermodel.dart';
import './editprofile.dart';

class Profile extends StatefulWidget {
  final String userId;

  Profile({this.userId});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    print(widget.userId);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: userRef.document(widget.userId).get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              var user=User.fromDoc(snapshot.data);
              print(user.name);
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://pbs.twimg.com/profile_images/1053055123193122816/IUwo6l_Q_400x400.jpg'),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "200",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Posts",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black26),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "200",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Posts",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black26),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          "200",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Posts",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black26),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${user.name ??""}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 80,
                          child: Text(
                            "${user.bio??"Bio"}",
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: FlatButton(
                        onPressed:()=>Navigator.push(context,MaterialPageRoute(builder: (_)=>EditProfile(user))),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Divider()
                ],
              );
            },
          )),
    );
  }
}
