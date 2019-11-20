import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1053055123193122816/IUwo6l_Q_400x400.jpg'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("200",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Text("Posts",style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("200",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Text("Posts",style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26
                                  ),)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("200",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Text("Posts",style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black26
                                  ),)
                                ],
                              )

                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: 150,
                            height: 30,
                            color: Colors.blue,
                            child: FlatButton(
                              child: Text("Edit Profile",style: TextStyle(
                                  color: Colors.white
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
