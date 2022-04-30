import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Users {
  String name;
  String username;
  String email;
  Users({
    required this.name,
    required this.username,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      name: json["nom"],
      username: json["prenom"],
      email: json["email"],);

  static Future<Users> getUsers() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/users/'),
    );
    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body)["success"][0][0]);
    } else {
      throw Exception('Failed to load post');
    }
  }

  static login(BuildContext context, email, password) async {
    try {
      Map<String, String> body = {"email": email, "psswd": password};
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8",
      };
      var url = Uri.parse('http://10.0.2.2:8000/api/authent/');
      var res = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      // print('Response status: ${res.statusCode}');
      // print('Response body: ${res.body}');

      if (res.statusCode == 200) {
        Navigator.pushNamed(context, '/liste');
      } else {
        Navigator.pushNamed(context, '/');
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
