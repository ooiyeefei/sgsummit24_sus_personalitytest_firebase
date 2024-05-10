import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/models/sus_heroes_model.dart';
import 'package:flutter/material.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
import 'package:sgsummit24_sus_personalitytest/widgets/hero_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // const Color cardBgColor = Color.fromARGB(255, 4, 101, 236);
    const Color cardBgColor = Colors.white;
    const Color bgColor = Color.fromRGBO(36, 49, 65, 1);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: -10,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Image(image: AssetImage("assets/AWS-Well-Architected-Sustainability-Pillar.png"),),),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    // textAlign: TextAlign.center,
                    "Which  ",
                    style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                      ),
                      Text(
                    // textAlign: TextAlign.center,
                    "Sustainability Heroes",
                    style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                              color: Color.fromARGB(255, 255, 153, 0),
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                      ),
                      Text(
                    // textAlign: TextAlign.center,
                    " Are You?",
                    style: GoogleFonts.robotoSlab(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.sizeOf(context).width * 0.35, 55),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    onPressed: () {
                      print("Start test");
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Find out now",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                            color: bgColor,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: susHeroesList.length,
                itemBuilder: (context, index) {
                  final heroesData = susHeroesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeroDetailPage(
                            heroName: heroesData.heroName,
                             heroImage: heroesData.heroImage,
                             topicColor: cardColor,
                             heroTagline: heroesData.heroTagline,
                             heroDescription: heroesData.heroDescription,
                          ),
                        ),
                      );
                      print(heroesData.heroName);
                    },
                    child: Card(
                      surfaceTintColor: cardBgColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: heroesData.heroImage,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              heroesData.heroName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                    color: bgColor,
                                    fontSize: MediaQuery.of(context).size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
