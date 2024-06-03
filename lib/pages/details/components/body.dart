import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/pages/details/components/image_and_icons.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    super.key, 
    required this.icon1, 
    required this.icon2, 
    required this.icon3, 
    required this.image, 
    required this.title, 
    required this.description, 
    required this.url1, 
    required this.url2, 
    required this.url3
  });

  final String icon1;
  final String icon2;
  final String icon3;
  final String image;
  final String title;
  final String description;
  final String url1;
  final String url2;
  final String url3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(
            icon1: icon1, 
            icon2: icon2, 
            icon3: icon3, 
            image: image, 
            url1: url1, 
            url2: url2, 
            url3: url3
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Palette.primaryOrange, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Palette.darkBlue,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
