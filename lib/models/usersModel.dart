// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.username,
    this.email,
    this.password,
  });

  String username;
  String email;
  String password;
  String error;

  Users.error(String errorMessage) {
    error = errorMessage;
  }

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
