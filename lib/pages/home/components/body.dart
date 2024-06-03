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
                          description: "El músculo del pecho, principalmente el pectoral mayor, es esencial para muchos movimientos del tren superior. Se extiende desde el esternón y las costillas hasta el húmero, permitiendo la aducción, rotación interna y flexión del brazo. Trabajarlo adecuadamente no solo mejora la fuerza y la apariencia, sino que también contribuye a la estabilidad del hombro y a la eficiencia en actividades cotidianas y deportivas.",
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=dWV4uWd2GvM',
                          url3: 'https://www.youtube.com/watch?v=0JOsnigDiMk',
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
                          description: "El músculo de la espalda, compuesto por grupos musculares como el dorsal ancho, trapecio y romboides, es crucial para la estabilidad y movilidad del tronco y los hombros. Estos músculos permiten movimientos como la extensión, aducción y rotación del brazo, así como la elevación y retracción de los omóplatos. Fortalecer la espalda mejora la postura, previene lesiones y potencia el rendimiento en actividades físicas y cotidianas.",
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url3: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
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
                          description: "Los músculos del brazo, incluyendo el bíceps, tríceps y antebrazo, son fundamentales para una variedad de movimientos, desde levantar objetos hasta realizar actividades cotidianas y deportivas. El bíceps flexiona el codo y supina el antebrazo, mientras que el tríceps lo extiende. Fortalecer estos músculos no solo mejora la estética, sino también la funcionalidad y el rendimiento en actividades que requieren fuerza y resistencia en los brazos.",
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url3: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
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
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url3: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
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
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url3: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
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
                          url1: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url2: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
                          url3: 'https://www.youtube.com/watch?v=vUMtItXfO8Y',
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
