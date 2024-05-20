import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:flutter/cupertino.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    super.key, required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(defaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: Palette.darkBlue.withOpacity(0.40)
          ),
          const BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Palette.white,
          )
        ]
      ),
      child:  Image.asset(icon),
    );
  }
}