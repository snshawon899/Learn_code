import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/utils/colors_contain.dart';

class NextQuestionButton extends StatelessWidget {
  const NextQuestionButton({super.key, required this.nextQuestion});
  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: InkWell(
        onTap: nextQuestion,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: neutral,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "Next Question",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
