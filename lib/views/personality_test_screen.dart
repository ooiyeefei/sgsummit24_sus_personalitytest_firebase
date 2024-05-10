import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/models/quiz_questions_model.dart';
import 'package:sgsummit24_sus_personalitytest/views/results_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String profile = '';
  List<QuizQuestion> _questions = questionsList;
  bool _hasSelectedOption = false; 
  // late Future<void> _initializeSupabaseFuture;

  // Future main() async {
  //   await dotenv.load(./dotenv);
  // }
  // late Future<void> _initializeSupabaseFuture = Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!,
  //   anonKey: dotenv.env['SUPABASE_ANON']!,
  // );
  
  Future<void> _postDataToSupabase() async {
  // Replace with your actual Supabase URL and anon key
  // final supabase = Supabase.instance.client;

  const tableName = 'sgsummit-suspersona'; // Replace with your actual table name
  final uuid = Uuid().v4(); // Generate a UUID

  // Extract the first 8 characters (assuming 64-bit BigInt)
  final subString = uuid.substring(0, 8);

  // Parse the substring as an integer (potential loss of information)
  final bigIntValue = BigInt.parse(subString, radix: 16);

  // Assuming you have variables like _score and profile to store data
  final data = {
    'id': bigIntValue.toInt(),
    // 'created_at': DateTime.now().toIso8601String(),
    'score': _score,
    'profile': profile,
    // Add other data fields as needed
  };

  try {
    await Supabase.instance.client.from(tableName).insert(data);
  } catch (error) {
    print('Error during Supabase operation: $error');
  }
}

  void _handleOptionSelection(int optionIndex) {
    setState(() {
      _questions[_currentQuestionIndex].selectedQuizOption =
          _questions[_currentQuestionIndex].options[optionIndex];
      _score += _questions[_currentQuestionIndex].selectedQuizOption!.points!;
      _hasSelectedOption = true;
    });
  }

  bool _isLastQuestion() {
    return _currentQuestionIndex == _questions.length - 1;
  }

  void _handleNextQuestion() {
    if (!_hasSelectedOption) {
      // Show error message if no option is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an option before proceeding'),
        ),
      );
      return;
    }
    if (_isLastQuestion()) {
      _evaluateResult();
       Text('Your Profile: $profile');
      // Post data to Supabase after potentially showing score
    _postDataToSupabase().then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsScreen(score: _score, profile: profile)),
      ).then((_) => _resetState());
    });
      return;
    }
    setState(() {
      _currentQuestionIndex++;
      _hasSelectedOption = false; // Reset selection status for next question
    });
  }

  String _getOptionLabel(int index) {
    const labels = ['A', 'B', 'C', 'D'];
    return labels[index];
  }

  void _evaluateResult() {
    if (_score >= 10 && _score <= 17) {
      profile = 'Truth Talker';
    } else if (_score >= 18 && _score <= 25) {
      profile = 'Energy Expert';
    } else if (_score >= 26 && _score <= 33) {
      profile = 'Green Guide';
    } else if (_score >= 34) {
      profile = 'Fume Fighter';
    }
  }

  void _resetState() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      profile = '';
      for (var question in _questions) {
        question.selectedQuizOption = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color cardBgColor = Colors.white;
    const Color bgColor = Color.fromRGBO(36, 49, 65, 1);
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: bgColor,
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
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Sustainability Personality Test',
          style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
          ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
            ),
          onPressed: () => Navigator.popAndPushNamed(context, '/home'), // Clear context and pop
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(
                  'Question ${_currentQuestionIndex + 1} / ${_questions.length}',
                  style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            color: cardBgColor,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                ),
            SizedBox(height: 30.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    textAlign: TextAlign.left,
                    currentQuestion.text,
                    style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                          color: cardBgColor,
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 20);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: currentQuestion.options.length,
                      itemBuilder: (context, index) {
                        final option = currentQuestion.options[index];
                        return Row(
                          children: [
                            ToggleButtons(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            constraints: BoxConstraints(
                              minHeight: 40.0, // Set a minimum height
                              maxHeight: double.infinity, // Allow for expansion
                            ),
                            selectedBorderColor: Colors.blue[700],
                            selectedColor: Colors.blueAccent,
                            fillColor: Colors.blueAccent,
                            isSelected: [
                              currentQuestion.selectedQuizOption?.text == option.text
                            ],
                            onPressed: (selectedIndexes) => _handleOptionSelection(index),
                            children: [
                              Container(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    '${_getOptionLabel(index)}. ${option.text!}',
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.robotoMono(
                                      textStyle: TextStyle(
                                        color: cardBgColor,
                                        fontSize: MediaQuery.of(context).size.width * 0.03,
                                        fontWeight: FontWeight.normal,
                                        ),
                                    ),
                                    ),
                                ),
                                  
                                  ],
                          ),
                          ],
                        );
                      },
                    
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: _hasSelectedOption ? _handleNextQuestion : null,
                        child: Text(
                          _isLastQuestion() ? 'Show Score' : 'Next Question',
                          style: GoogleFonts.robotoMono(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (_isLastQuestion()) Text('Your Score: $_score'),
          ],
        ),
      ),
    );
  }
}