import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/pages/home/components/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      title: const Text("BODY FITNESS", style: TextStyle(color: Palette.white, fontWeight: FontWeight.bold),),
      backgroundColor: Palette.primaryOrange,
      centerTitle: true,
    ),
    body: Body(),
    backgroundColor: Palette.white,
  );
}
}