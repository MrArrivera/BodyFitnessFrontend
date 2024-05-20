import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:flutter/material.dart';

class RecommendExcercisesCard extends StatelessWidget {
  const RecommendExcercisesCard({
    super.key, required this.image, required this.title, required this.description, required this.press,
  });

  final String image, title, description;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 2,
        bottom: defaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [ BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: Palette.secondaryOrange.withOpacity(0.23)
                ),
                ]
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$description".toUpperCase(),
                          style: TextStyle(
                            color: Palette.darkBlue.withOpacity(0.5),
                          )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

