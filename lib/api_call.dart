// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Users {
  String name;
  String username;
  String date_seance;
  Users({
    required this.name,
    required this.username,
    required this.date_seance,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      name: json["nom"],
      username: json["prenom"],
      date_seance: json["date_seance"],
  );

  static Future<List> getUsers() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8000/api/inscription/'),
    );
    if (response.statusCode == 200) {
      // List res = (json.decode(response.body) as List);
      // var test = res.map((user) => Users.fromJson(user)).toList();
      List result = jsonDecode(response.body)["success"][0];
      return result.map((e) => Users.fromJson(e)).toList();
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
