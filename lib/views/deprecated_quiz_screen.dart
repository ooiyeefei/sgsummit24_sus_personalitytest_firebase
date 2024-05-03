import 'dart:async';
import 'package:sgsummit24_sus_personalitytest/views/results_screen.dart';
import 'package:sgsummit24_sus_personalitytest/models/quiz_questions_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key,});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 1;
  PageController _controller = PageController();
  int score = 0;
  bool isLocked = false;
  List optionsLetters = ["A.", "B.", "C.", "D."];
  int totalQuestionsLength = questionsList.length;

  void navigateToNewScreen() {
    if (_questionNumber < totalQuestionsLength) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _questionNumber++;
        isLocked = false;
      });
      _resetQuestionLocks();
    } else {
      print(score);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultsScreen(
      //       score: score,
      //       totalQuestions: totalQuestionsLength,
      //     ),
      //   ),
      // );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _resetQuestionLocks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color bgColor = Color(0xFF4993FA);

    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: bgColor3,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                          weight: 10,
                        ),
                      ),
                    Text(
                      "Sustainability Personality Test",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.24),
                        blurRadius: 20.0,
                        offset: const Offset(0.0, 10.0),
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question $_questionNumber/$totalQuestionsLength",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: questionsList.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _questionNumber = value + 1;
                                  isLocked = false;
                                  _resetQuestionLocks();
                                });
                              },
                              itemBuilder: (context, index) {
                                final myquestions =
                                    questionsList[index];
                                // var optionsIndex = widget.optionsList[index];
                                return Column(
                                  children: [
                                    Flexible(
                                    child: Text(
                                      myquestions.text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 18,
                                          ),
                                    ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: myquestions.options.length,
                                        itemBuilder: (context, index) {
                                          var color = Colors.grey.shade200;
                                          var questionOption = myquestions.options[index];
                                          final letters = optionsLetters[index];

                                          if (myquestions.isLocked) {
                                            score += questionOption.points!;
                                          }
                                          return InkWell(
                                            onTap: () {
                                              // print(optionsIndex);
                                              if (!myquestions.isLocked) {
                                                setState(() {
                                                  myquestions.isLocked = true;
                                                  myquestions.selectedQuizOption = questionOption;
                                                });
                                                isLocked = myquestions.isLocked;
                                              }
                                            },
                                            child: Container(
                                              height: 45,
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: color),
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                  child: Text(
                                                    "$letters ${questionOption.text}",
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  ),
                                                  ),
                                                  // isLocked == true
                                                  //     ? questionOption.isCorrect
                                                  //         ? const Icon(
                                                  //             Icons
                                                  //                 .check_circle,
                                                  //             color:
                                                  //                 Colors.green,
                                                  //           )
                                                  //         : const Icon(
                                                  //             Icons.cancel,
                                                  //             color: Colors.red,
                                                  //           )
                                                  //     : const SizedBox.shrink()
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          isLocked
                              ? buildElevatedButton()
                              : const SizedBox.shrink(),
                              const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _resetQuestionLocks() {
    for (var question in questionsList) {
      question.isLocked = false;
    }
  }

  ElevatedButton buildElevatedButton() {
    //  const Color bgColor3 = Color(0xFF5170FD);
    const Color cardColor = Color(0xFF4993FA);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(cardColor),
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.sizeOf(context).width * 0.80, 40),
        ),
        elevation: MaterialStateProperty.all(4),
      ),
      onPressed: () {
        if (_questionNumber < totalQuestionsLength) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _questionNumber++;
            isLocked = false;
          });
          _resetQuestionLocks();
        } else {
          print(score);
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ResultsScreen(
          //       score: score,
          //       totalQuestions: totalQuestionsLength,
          //     ),
          //   ),
          // );
        }
      },
      child: Text(
        _questionNumber < totalQuestionsLength
            ? 'Next Question'
            : 'Result',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
