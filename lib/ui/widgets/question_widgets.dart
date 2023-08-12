import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/utils/colors_contain.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.indexAction,
    required this.totalQuestion,
  });
  final String question;
  final int indexAction;
  final int totalQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Question ${indexAction + 1}/$totalQuestion:$question :",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
