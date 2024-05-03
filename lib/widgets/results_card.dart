import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/widgets/dotted_lines.dart';
import 'package:sgsummit24_sus_personalitytest/models/sus_heroes_model.dart';
import 'package:flutter/material.dart';
import 'package:sgsummit24_sus_personalitytest/widgets/hero_detail.dart';

class ResultsCard extends StatelessWidget {
  ResultsCard({
    super.key,
    required this.profile,
  });
  final String profile;
  final heroesData = susHeroesList;
  late SusHeroes hero;

   heroProfile(String profile) {
      switch (profile) {
        case 'Truth Talker':
          hero = heroesData[0];
          break;
        case 'Green Guide':
          hero = heroesData[1];
          break;
        case 'Fume Fighter':
          hero = heroesData[2];
          break;
        case 'Energy Expert':
          hero = heroesData[3];
          break;
      }
    }

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Colors.white;
    const Color bgColor = Color.fromRGBO(36, 49, 65, 1);

    heroProfile(profile);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.888,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          Card(
            surfaceTintColor: cardBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Congratulations!",
                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                          color: bgColor,
                                          fontSize: MediaQuery.of(context).size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          ),
                                ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Your Sustainability Hero is:",
                    style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                          color: bgColor,
                                          fontSize: MediaQuery.of(context).size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          ),
                                ),
                  ),
                  const SizedBox(height: 15),
                  CustomPaint(
                    painter: DrawDottedhorizontalline(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                                children: [
                                  Text(
                                    hero.heroName,
                                    style: GoogleFonts.robotoSlab(
                                        textStyle: TextStyle(
                                          color: bgColor,
                                          fontSize: MediaQuery.of(context).size.width * 0.04,
                                          fontWeight: FontWeight.bold,
                                          ),
                                ),
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector( // Wrap with GestureDetector
                                    onTap: () {
                                      Navigator.push( // Use Navigator.push
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HeroDetailPage( // Replace with your hero details screen
                                            heroName: hero.heroName,
                                            heroImage: hero.heroImage,
                                            topicColor: cardColor,
                                            heroTagline: hero.heroTagline,
                                            heroDescription: hero.heroDescription,// Pass hero details
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: hero.heroImage, // Access hero image from passed object
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "Click on image to find out more!",
                                    style: GoogleFonts.acme(
                                        textStyle: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: MediaQuery.of(context).size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor, shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
