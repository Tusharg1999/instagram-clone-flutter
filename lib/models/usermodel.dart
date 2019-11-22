import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String profileUrl;
  final String name;
  final String email;
  final String bio;

  User({this.id,this.email,this.name,this.bio,this.profileUrl});

  factory User.fromDoc(DocumentSnapshot doc){
    return User(
      id: doc.documentID,
      email: doc['email'],
      name: doc['name'],
      bio: doc['bio']??'',
      profileUrl: doc['profileUrl']
    );
  }
}
