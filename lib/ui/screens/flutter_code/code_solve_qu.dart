import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/model/question_models.dart';
import 'package:laren_program_app/ui/widgets/next_question.dart';
import 'package:laren_program_app/ui/widgets/options_card.dart';
import 'package:laren_program_app/ui/widgets/question_widgets.dart';
import 'package:laren_program_app/ui/widgets/result_box_widget.dart';
import 'package:laren_program_app/utils/colors_contain.dart';

class CodeSolveQuestionFlutter extends StatefulWidget {
  const CodeSolveQuestionFlutter({super.key});

  @override
  State<CodeSolveQuestionFlutter> createState() =>
      _CodeSolveQuestionFlutterState();
}

class _CodeSolveQuestionFlutterState extends State<CodeSolveQuestionFlutter> {
  List<QuestionModel> flutterQuestions = [
    QuestionModel(
      id: '1',
      title: "What is 2+2",
      options: {
        '5': false,
        '10': false,
        '4': true,
        '12': false,
      },
    ),
    QuestionModel(
      id: '2',
      title: "What is 5x6",
      options: {
        '50': false,
        '30': true,
        '35': false,
        '28': false,
      },
    ),
    // QuestionModel(
    //   id: '3',
    //   title: "What is 50/2",
    //   options: {
    //     '25': true,
    //     '10': false,
    //     '30': false,
    //     '12': false,
    //   },
    // ),
    // QuestionModel(
    //   id: '4',
    //   title: "What is 65-15",
    //   options: {
    //     '52': false,
    //     '48': false,
    //     '60': false,
    //     '50': true,
    //   },
    // ),
    // QuestionModel(
    //   id: '5',
    //   title: "What is 100 % 10",
    //   options: {
    //     '0.1': true,
    //     '0.3': false,
    //     '0.4': false,
    //     '0.12': false,
    //   },
    // ),
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
        "Flutter Question",
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
