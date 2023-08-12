import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/utils/colors_contain.dart';

class ResultBoxWidgets extends StatelessWidget {
  const ResultBoxWidgets(
      {super.key,
      required this.onTap,
      required this.result,
      required this.questionLenght});
  final VoidCallback onTap;
  final int result;
  final int questionLenght;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result",
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: result == questionLenght / 2
                  ? Colors.yellow
                  : result < questionLenght / 2
                      ? incorrect
                      : correct,
              radius: 60,
              child: Text(
                '$result/$questionLenght',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(result == questionLenght / 2
                ? "Almost There"
                : result < questionLenght / 2
                    ? 'Try Again'
                    : 'Great!'),
            const SizedBox(height: 20),
            InkWell(
              onTap: onTap,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Start Over",
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
