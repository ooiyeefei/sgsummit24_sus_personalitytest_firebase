import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
// import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  final String heroName;
  final Image heroImage;
  final Color topicColor;
  final String heroTagline;
  final String heroDescription;

  const HeroDetailPage({
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
        child: Center(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
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
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.85,
                child: Card.filled(
                  color: cardBgColor,
                  child: Center(
                        child: Column(
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
                              margin: EdgeInsets.fromLTRB(20,0,20,0),
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
                                ],
                              ),
                            ),
                        ],
                        ),
                      ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardBgColor),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.sizeOf(context).width * 0.3, 40),
                      ),
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
                                          fontSize: MediaQuery.of(context).size.width * 0.02,
                                          fontWeight: FontWeight.bold,
                                          ),
                                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
