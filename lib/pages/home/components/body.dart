import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/pages/details/detailed_screen.dart';
import 'package:body_fitness_frontend/pages/home/components/header_with_search_box.dart';
import 'package:body_fitness_frontend/pages/home/components/recommend_excercises_card.dart';
import 'package:body_fitness_frontend/pages/home/components/recommended_title.dart';
import 'package:flutter/material.dart';
import 'package:body_fitness_frontend/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          const RecommendedTitle(title: "Ejercicios recomendados",),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RecommendExcercisesCard(
                  image: "lib/assets/images/chest.png",
                  title: "Pecho",
                  description: "Ejercicios",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/banca_inclinado.png",
                          icon2: "lib/assets/icons/press_plano.png",
                          icon3: "lib/assets/icons/flys_en_polea.png",
                          image: "lib/assets/images/chest.png",
                          title: "Pecho",
                          description: "Pecho",
                        ),
                      )  
                    );
                  },
                ),
                RecommendExcercisesCard(
                  image: "lib/assets/images/back.png",
                  title: "Espalda",
                  description: "Ejercicios",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/pull_ups.png",
                          icon2: "lib/assets/icons/dorsales.png",
                          icon3: "lib/assets/icons/trapecios.png",
                          image: "lib/assets/images/back.png",
                          title: "Espalda",
                          description: "Espalda",
                        ),
                      )  
                    );
                  },
                ),
                RecommendExcercisesCard(
                  image: "lib/assets/images/arm.png",
                  title: "Brazo",
                  description: "Ejercicios",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/laterales.png",
                          icon2: "lib/assets/icons/curl_bicep.png",
                          icon3: "lib/assets/icons/fondos.png",
                          image: "lib/assets/images/arm.png",
                          title: "Brazo",
                          description: "Brazo",
                        ),
                      )  
                    );
                  },
                ),
              ],
            ),
          ),
          const RecommendedTitle(title: "Dietas recomendadas",),
          const SizedBox(height: 30,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RecommendExcercisesCard(
                  image: "lib/assets/images/high_protein_meal.png",
                  title: "Pollo con arroz",
                  description: "Dietas",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/banca_inclinado.png",
                          icon2: "lib/assets/icons/press_plano.png",
                          icon3: "lib/assets/icons/flys_en_polea.png",
                          image: "lib/assets/images/chest.png",
                          title: "Pecho",
                          description: "Pecho",
                        ),
                      )  
                    );
                  },
                ),
                RecommendExcercisesCard(
                  image: "lib/assets/images/high_protein_meal.png",
                  title: "Pollo con arroz",
                  description: "Dietas",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/banca_inclinado.png",
                          icon2: "lib/assets/icons/press_plano.png",
                          icon3: "lib/assets/icons/flys_en_polea.png",
                          image: "lib/assets/images/chest.png",
                          title: "Pecho",
                          description: "Pecho",
                        ),
                      )  
                    );
                  },
                ),
                RecommendExcercisesCard(
                  image: "lib/assets/images/high_protein_meal.png",
                  title: "Pollo con arroz",
                  description: "Dietas",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          icon1: "lib/assets/icons/banca_inclinado.png",
                          icon2: "lib/assets/icons/press_plano.png",
                          icon3: "lib/assets/icons/flys_en_polea.png",
                          image: "lib/assets/images/chest.png",
                          title: "Pecho",
                          description: "Pecho",
                        ),
                      )  
                    );
                  },
                ),
              ]
            ),
          )
          
        ],
      ),
    );
  }
}
