import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/ui/screens/c++_code/c_code_solve_qu.dart';

import '../../widgets/code_solve_video_widgets.dart';
import 'c++video_list.dart';

class CPlusCodeSolveVideo extends StatelessWidget {
  const CPlusCodeSolveVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "C++",
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
                      builder: (_) => const CodeSolveQuestionCPlus(),
                    ),
                  );
                },
                text: "C++ Code Solve",
                icon: Icons.edit,
              ),
              const SizedBox(height: 20),
              CodeSolveVideoQuestion(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CPlusVideoList()),
                  );
                },
                text: "C++ Video Code",
                icon: Icons.video_file,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
