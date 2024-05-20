import 'dart:async';
import 'package:body_fitness_frontend/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var url = Uri.parse('http://10.0.2.2:3000/users');

// Get All Users
Future<List<User>> getUsers() async {
  final res = await http.get(url);

  if (res.statusCode == 200) {
    final List<dynamic> data = jsonDecode(res.body);

    final List<User> users = data.map((user) {
      return User.fromJson(user);
    }).toList();
    return users;
  } else {
    return [];
  }
}
