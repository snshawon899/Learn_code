import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/model/question_models.dart';
import 'package:laren_program_app/ui/widgets/next_question.dart';
import 'package:laren_program_app/ui/widgets/options_card.dart';
import 'package:laren_program_app/ui/widgets/question_widgets.dart';
import 'package:laren_program_app/ui/widgets/result_box_widget.dart';
import 'package:laren_program_app/utils/colors_contain.dart';

class CodeSolveQuestionPython extends StatefulWidget {
  const CodeSolveQuestionPython({super.key});

  @override
  State<CodeSolveQuestionPython> createState() =>
      _CodeSolveQuestionPythonState();
}

class _CodeSolveQuestionPythonState extends State<CodeSolveQuestionPython> {
  List<QuestionModel> flutterQuestions = [
    QuestionModel(
      id: '1',
      title: "What is Python?",
      options: {
        'Python is language': false,
        'Python is an interpreted scripting language': true,
        'Program Language': false,
        'Python is Framework': false,
      },
    ),
    QuestionModel(
      id: '2',
      title: "What is pep 8?",
      options: {
        'Python Enhancement Proposal': true,
        'Python code to ensure': false,
        'It comprises a collection': false,
        'Clarity and legibility': false,
      },
    ),
    QuestionModel(
      id: '3',
      title: "What are Python Modules?",
      options: {
        'dart io': false,
        'kivy': false,
        'sys': true,
        'toilet': false,
      },
    ),
    QuestionModel(
      id: '4',
      title:
          " What is a dictionary in Python?\ndict={‘Country’:’India’,’Capital’:’New Delhi’, }",
      options: {
        '‘Country’:’India’,’Capital’:’New Delhi’': false,
        'Country: India, Capital: New Delhi': true,
        'India,New Delhi': false,
        'Sys Error': false,
      },
    ),
    QuestionModel(
      id: '5',
      title:
          "What are functions in Python?\ndef my_function():print(Hi, Welcome to Intellipaat)my_function()",
      options: {
        'Hi, Welcome to Intellipaat': true,
        'print(Hi, Welcome to Intellipaat)': false,
        'Code Error': false,
        'my_function("hello")': false,
      },
    ),
  ];
  int index = 0;
  int score = 0;
  bool isAlreadySelected = false;
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: Text(
        "Python Question",
        style: GoogleFonts.poppins(),
      )),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              QuestionWidget(
                question: flutterQuestions[index].title,
                indexAction: index,
                totalQuestion: flutterQuestions.length,
              ),
              const Divider(
                color: neutral,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < flutterQuestions[index].options.length; i++)
                InkWell(
                  onTap: () {
                    checkAnswerAndUpdate(
                        flutterQuestions[index].options.values.toList()[i]);
                  },
                  child: OptionsCardWidget(
                    option: flutterQuestions[index].options.keys.toList()[i],
                    color: isPressed
                        ? flutterQuestions[index].options.values.toList()[i] ==
                                true
                            ? correct
                            : incorrect
                        : Colors.white,
                  ),
                ),
              const SizedBox(height: 30),
              Text(
                "Score: $score",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: NextQuestionButton(
        nextQuestion: () {
          nextQuestion();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void nextQuestion() {
    if (index == flutterQuestions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => ResultBoxWidgets(
                onTap: () {
                  startOver();
                  Navigator.pop(context);
                },
                result: score,
                questionLenght: flutterQuestions.length,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              "Please selete any question",
              style: GoogleFonts.poppins(),
            ),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 20, vertical: 10),
          ),
        );
      }
    }
  }

  void changedColor() {
    setState(() {
      isPressed = true;
    });
  }
}
