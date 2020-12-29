import 'package:flutter/material.dart';

class User {
  String email;
  String password;
  String name;
  String imageUrl;
  UserRole role;

  User({
    @required email, 
    @required password, 
    @required name, 
    @required imageUrl, 
    @required role
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      password: json["password"],
      name: json["name"],
      imageUrl: json["imageUrl"],
      role: json["role"] == 0 ? UserRole.Admin : UserRole.Pacient);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'imageUrl': imageUrl,
      'role': role == UserRole.Admin ? 0 : 1
    };
  }

}

enum UserRole {
  Admin, Pacient
}