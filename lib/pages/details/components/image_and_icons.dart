import 'package:body_fitness_frontend/assets/constants.dart';
import 'package:body_fitness_frontend/assets/palette.dart';
import 'package:body_fitness_frontend/pages/details/components/icon_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    super.key, 
    required this.icon1, 
    required this.icon2, 
    required this.icon3, 
    required this.image, 
    required this.url1, 
    required this.url2, 
    required this.url3,
  });

  final String icon1;
  final String icon2;
  final String icon3;
  final String image;
  final String url1;
  final String url2;
  final String url3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Uri _url1 = Uri.parse(url1);
    final Uri _url2 = Uri.parse(url2);
    final Uri _url3 = Uri.parse(url3);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding * 3),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        _launchUrl(_url1);
                      },
                      icon: Image.asset(icon1),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchUrl(_url2);
                      },
                      icon: Image.asset(icon2),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchUrl(_url3);
                      },
                      icon: Image.asset(icon3),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: Palette.primaryOrange.withOpacity(0.29)
                  )
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage(image)
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
