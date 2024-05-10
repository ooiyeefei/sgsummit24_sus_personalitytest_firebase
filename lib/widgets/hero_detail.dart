import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroDetailPage extends StatelessWidget {
  final String heroName;
  final Image heroImage;
  final Color topicColor;
  final String heroTagline;
  final String heroDescription;
  late String email = 'xxx@email.com';
  late String subject = 'Interested';
  late String body = 'I would like to know more about sustainable IT';

  Future<void> _launchEmail() async {
    final url = Uri.parse('mailto:$email?subject=$subject&body=$body');
    if (!await canLaunchUrl(url)) {
      throw 'Could not launch $url';
    }
    await launchUrl(url);
  }

  HeroDetailPage({
    super.key,
    required this.heroName,
    required this.heroImage,
    required this.topicColor,
    required this.heroTagline,
    required this.heroDescription,
  });
  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Colors.white;
    const Color bgColor = Color.fromRGBO(36, 49, 65, 1);
    
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // physics: const AlwaysScrollableScrollPhysics(),
            // padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 18.0),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        weight: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                constraints: BoxConstraints( // Set constraints for max width in landscape
                    maxWidth: MediaQuery.of(context).size.width * 0.92, // Adjust max width as needed
                  ),
                // width: MediaQuery.of(context).size.width * 0.92,
                // height: MediaQuery.of(context).size.height * 0.8,
                child: Card.filled(
                  margin: EdgeInsets.all(25),
                  color: cardBgColor,
                  child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              child: heroImage,
                              ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              heroName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    color: bgColor,
                                    fontSize: MediaQuery.of(context).size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    ),
                                ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                            Container(
                              margin: EdgeInsets.fromLTRB(18,0,18,0),
                              child: Column(
                                children: [
                                  Text(
                                    heroTagline,
                                    textAlign: TextAlign.center,
                                      style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                          color: bgColor,
                                          fontSize: MediaQuery.of(context).size.width * 0.03,
                                          fontWeight: FontWeight.bold,
                                          ),
                                ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Card.outlined(
                                    color: bgColor,
                                    child:  Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                      heroDescription,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.robotoMono(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context).size.width * 0.025,
                                          fontWeight: FontWeight.bold,
                                          ),
                                      ),
                                    ),
                                    
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Get in touch with us to assess your IT carbon footprint and\nlearn more about AWS silicon like Graviton, Inferential and Trainium!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.robotoSlab(
                                        textStyle: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: MediaQuery.of(context).size.width * 0.02,
                                          fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(cardBgColor),
                                      padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
                                      elevation: MaterialStateProperty.all(4),
                                    ),
                                    onPressed: _launchEmail,
                                    child: Text(
                                      "Reach out",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.robotoMono(
                                              textStyle: TextStyle(
                                                color: bgColor,
                                                fontSize: MediaQuery.of(context).size.width * 0.02,
                                                fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                        ),
                      ),
                  ),
                ),
              ), 
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardBgColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                      print("Start Test");
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                          ),
                        ),
                      );
                    },
                child: Text(
                  "Start Test",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            color: bgColor,
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                ),
              ),
              // Column(
              //   children: [
              //     ElevatedButton(
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(cardBgColor),
              //         elevation: MaterialStateProperty.all(4),
              //       ),
              //       onPressed: () {
              //         print("Start Test");
              //         Navigator.of(context).pushReplacement(
              //           MaterialPageRoute(
              //             builder: (context) => QuizScreen(
              //             ),
              //           ),
              //         );
              //       },
              //       child: Text(
              //         "Start Test",
              //         textAlign: TextAlign.center,
              //         style: GoogleFonts.robotoMono(
              //           color: bgColor,
              //             textStyle: TextStyle(
              //               fontSize: MediaQuery.of(context).size.width * 0.02,
              //               fontWeight: FontWeight.bold,
              //               ),
              //           ),
              //       ),
              //     )
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  textAlign: TextAlign.center,
                    'powered by Supabase, an AWS partner :)',
                    style: GoogleFonts.robotoMono(
                                    textStyle: TextStyle(
                                      color: cardBgColor,
                                      fontSize: MediaQuery.of(context).size.width * 0.015,
                                      fontWeight: FontWeight.bold,
                                      ),
                                  ),
                    ),
                ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
