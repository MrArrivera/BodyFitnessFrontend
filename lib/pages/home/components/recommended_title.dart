import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:flutter/material.dart';

class RecommendedTitle extends StatelessWidget {
  const RecommendedTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
           Padding(
            padding:  EdgeInsets.only(left: defaultPadding / 4),
            child:  Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: defaultPadding / 4),
              height: 7,
              color: Palette.primaryOrange.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
