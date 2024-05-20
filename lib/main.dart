//import 'package:body_fitness_frontend/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:body_fitness_frontend/pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
