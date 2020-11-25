import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String email;
  String uid;
  String username;
  DateTime timestamp;

  UserModel({this.email, this.uid, this.username, this.timestamp});

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = user.uid;
    data["username"] = user.username;
    data["email"] = user.email;
    data["timestamp"] = user.timestamp;

    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.username = mapData["username"];
    this.email = mapData["email"];
  }

//  factory UserModel.fromDocument(DocumentSnapshot doc) {
//    return UserModel(
//        uid: doc["uid"], email: doc["email"], username: doc["username"]);
//  }
}
