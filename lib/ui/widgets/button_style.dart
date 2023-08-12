import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyleFrom extends StatelessWidget {
  const ButtonStyleFrom({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoader = false,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final bool isLoader;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff8449FA),
        minimumSize: const Size(360, 50),
      ),
      onPressed: onPressed,
      child: isLoader
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              buttonText,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
