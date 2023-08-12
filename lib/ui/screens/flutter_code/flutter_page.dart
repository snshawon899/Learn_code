import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/ui/screens/flutter_code/code_solve_qu.dart';
import 'package:laren_program_app/ui/widgets/code_solve_video_widgets.dart';

import 'flutter_video_list.dart';

class FlutterChoiceCode extends StatelessWidget {
  const FlutterChoiceCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Flutter Program",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CodeSolveVideoQuestion(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CodeSolveQuestionFlutter(),
                    ),
                  );
                },
                text: "Flutter Code Solve",
                icon: Icons.edit,
              ),
              const SizedBox(height: 20),
              CodeSolveVideoQuestion(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FlutterVideoList(),
                    ),
                  );
                },
                text: "Flutter Video Code",
                icon: Icons.video_file,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
