import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/ui/screens/java_script_code/java_code_solve_qu.dart';

import '../../widgets/code_solve_video_widgets.dart';

import 'javaScript_video_list.dart';

class JavaScriptCodeVideo extends StatelessWidget {
  const JavaScriptCodeVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "JavaScript",
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
                      builder: (_) => const CodeSolveQuestionJavaScript(),
                    ),
                  );
                },
                text: "JavaScript Code Solve",
                icon: Icons.edit,
              ),
              const SizedBox(height: 20),
              CodeSolveVideoQuestion(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const JavaScriptVideoList(),
                    ),
                  );
                },
                text: "JavaScript Video Code",
                icon: Icons.video_file,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
