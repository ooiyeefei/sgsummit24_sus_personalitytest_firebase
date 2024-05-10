import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/widgets/results_card.dart';
import 'package:flutter/material.dart';

double adaptFontSize(BuildContext context, double baseFontSize) {
  // You can adjust the multiplier or logic here based on your preferences
  return baseFontSize * MediaQuery.of(context).size.width * 0.003;
}

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
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
        // bottomSheet: Padding(
        // padding: EdgeInsets.all(10.0),
        // child: Text(
        //     'powered by Supabase, an AWS partner :)',
        //     style: GoogleFonts.robotoMono(
        //                     textStyle: TextStyle(
        //                       color: cardBgColor,
        //                       fontSize: MediaQuery.of(context).size.width * 0.015,
        //                       fontWeight: FontWeight.bold,
        //                       ),
        //                   ),
        //     ),
        // ),
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
        body: SafeArea(
          child: SingleChildScrollView(
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardBgColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/quiz');
                },
                child: Text(
                  "Re-test",
                  style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            color: bgColor,
                            fontSize: MediaQuery.of(context).size.width * 0.02,
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
                  padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
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
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                ),
              ),
              ],
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
                height: 10,
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
