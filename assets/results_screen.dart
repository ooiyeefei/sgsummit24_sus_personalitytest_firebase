import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/views/home_screen.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
import 'package:sgsummit24_sus_personalitytest/widgets/results_card.dart';
import 'package:flutter/material.dart';

double adaptFontSize(BuildContext context, double baseFontSize) {
  // You can adjust the multiplier or logic here based on your preferences
  return baseFontSize * MediaQuery.of(context).size.width * 0.003;
}

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.score,
      required this.profile
      });
  final int score;
  final String profile;
  

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Colors.white;
    const Color bgColor = Color.fromRGBO(36, 49, 65, 1);
    print(score);
    print(profile);
  
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
                // Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Results",
                      style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                            color: Colors.white,
                            // fontSize: MediaQuery.of(context).size.width * 0.08,
                            // fontSize: 0.08 * MediaQuery.of(context).size.width * 0.003,
                            fontSize: adaptFontSize(context, 0.08),
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
              ResultsCard(
                  profile: profile,
                  ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardBgColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width * 0.30, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/quiz');
                },
                child: Text(
                  "Re-test",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            color: bgColor,
                            // fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontSize: adaptFontSize(context, 0.025),
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardBgColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width * 0.3, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                child: Text(
                  "Home",
                  style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            color: bgColor,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                ),
              ),
              ],
              ),
            ],
          ),
            ),
        ),
      ),
      ),
    );
  }
}
