import 'dart:convert';

import 'package:http/http.dart' as http;

class Users {
  String name;
  String username;
  String email;
  dynamic birthday;
  Users({
    required this.name,
    required this.username,
    required this.email,
    required this.birthday,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["nom"],
        username: json["prenom"],
        email: json["email"],
        birthday: json["ddn"]
      );
}

Future<Users> getUsers() async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/api/users/'),
  );
  if (response.statusCode == 200) {
    // print(json.decode(response.body)["success"][0][0]["id_utilisateur"]); // print du json du backend 
    return Users.fromJson(json.decode(response.body)["success"][0][0]);
  } else {
    throw Exception('Failed to load post');
  }
}

