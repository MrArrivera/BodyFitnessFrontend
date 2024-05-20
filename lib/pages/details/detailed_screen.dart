import 'package:body_fitness_frontend/pages/details/components/body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.icon1, required this.icon2, required this.icon3, required this.image, required this.title, required this.description});
  final String icon1, icon2, icon3, image, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(icon1: icon1, icon2: icon2, icon3: icon3, image: image, title: title, description: description,),
    );
  }
}