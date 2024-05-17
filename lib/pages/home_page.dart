import 'dart:convert'; 
import 'package:body_fitness_frontend/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String serverUrl = 'http://10.0.2.2:3000';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$serverUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userList = jsonDecode(response.body);
      final List<User> users = userList.map((user) {
        return User.fromJson(user);
      }).toList();
      return users;
    } else {
      throw Exception("Failed to fetch items");
    }
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Body Fitness"),
    ),
    body: SafeArea(
      child: Column(
        children: [
          FutureBuilder(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return ListTile(
                        title: Text(user.name, style: TextStyle(fontSize: 8)),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}
}