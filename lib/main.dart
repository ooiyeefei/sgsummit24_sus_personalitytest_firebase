import 'package:sgsummit24_sus_personalitytest/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sgsummit24_sus_personalitytest/views/personality_test_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: "./dotenv");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON']!,
  );
  final supabase = Supabase.instance.client;

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
         bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),),
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
