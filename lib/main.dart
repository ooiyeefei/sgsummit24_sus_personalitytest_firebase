import 'package:sgsummit24_sus_personalitytest/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Which Sustainability Heroes Are You?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
      '/quiz': (context) => QuizScreen(), // Add route for quiz screen
      '/home': (context) => HomePage(),
    },
    );
  }
}
