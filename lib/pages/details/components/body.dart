import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/pages/details/components/image_and_icons.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.icon1, required this.icon2, required this.icon3, required this.image, required this.title, required this.description});
  final String icon1, icon2, icon3, image, title, description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageAndIcons(icon1: icon1, icon2: icon2, icon3: icon3, image: image,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$title\n",
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Palette.primaryOrange, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: description,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Palette.darkBlue,
                          fontWeight: FontWeight.w300,
                        )
                      )
                    ]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}