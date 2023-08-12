import 'package:flutter/material.dart';

class FromFieldWidgets extends StatelessWidget {
  const FromFieldWidgets(
      {super.key,
      required this.text,
      this.controller,
      this.validator,
      this.keyboardType,
      this.obscureText = false});
  final String text;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (validator != null) {
          validator!(value);
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.only(left: 16),
        filled: true,
        fillColor: const Color(0xffD1BBFD),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
