import 'dart:convert';

class User {
  final String email, authId;

  User({required this.email, required this.authId});

  toJson() => {'email': email, 'authId': email};
  factory User.fromJson(Map<String, dynamic> json) =>
      User(email: json['email'], authId: json['authId']);
}
