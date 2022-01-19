import 'package:flutter/cupertino.dart';

class UserModel {
  String uid;
  String fullName;
  String email;
  String profileImage;
  int dt;

  UserModel({
    @required this.uid,
    @required this.fullName,
    @required this.email,
    @required this.profileImage,
    @required this.dt,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      profileImage: map['profileImage'],
      dt: map['dt'],
    );
  }
}
