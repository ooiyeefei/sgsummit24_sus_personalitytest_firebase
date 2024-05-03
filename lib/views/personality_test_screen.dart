import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sgsummit24_sus_personalitytest/models/quiz_questions_model.dart';
import 'package:sgsummit24_sus_personalitytest/views/results_screen.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsScreen(score: _score, profile: profile)),
      ).then((_) => _resetState());
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
    } else if (_score >= 34 && _score <= 40) {
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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Sustainability Personality Test',
          style: GoogleFonts.robotoSlab(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.045,
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
                            fontSize: 16,
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
                                  padding: EdgeInsets.all(8.0),
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