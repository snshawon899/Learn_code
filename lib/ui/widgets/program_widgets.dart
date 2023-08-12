import 'package:flutter/material.dart';

class ProgramWidgets extends StatelessWidget {
  const ProgramWidgets({super.key, required this.onTap, required this.img});
  final VoidCallback onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(4, 4),
              color: Colors.black.withOpacity(.4),
            ),
          ],
        ),
        child: Image.asset(img),
      ),
    );
  }
}
