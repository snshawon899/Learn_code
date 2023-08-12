import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeSolveVideoQuestion extends StatelessWidget {
  const CodeSolveVideoQuestion({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final VoidCallback onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 60,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.4),
              ),
            ],
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
