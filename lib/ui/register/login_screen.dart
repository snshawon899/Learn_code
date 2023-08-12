import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/ui/register/signup_page.dart';
import 'package:laren_program_app/ui/widgets/button_style.dart';

import '../../utils/tost_message.dart';
import '../screens/home_page.dart';
import '../widgets/from_widget_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome To Login",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              FromFieldWidgets(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter email";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(val!)) {
                    return "Please enter a valid email";
                  }
                },
                text: "example@gmail.com",
              ),
              const SizedBox(height: 15),
              FromFieldWidgets(
                controller: passwordController,
                keyboardType: TextInputType.text,
                validator: (val) {
                  RegExp regExp = RegExp(r'^.{6,}$');
                  if (val?.isEmpty ?? true) {
                    return "Please enter password";
                  }
                  if (!regExp.hasMatch(val!)) {
                    return "Please enter a valid password(Min 6 Character)";
                  }
                },
                obscureText: true,
                text: "**********",
              ),
              const SizedBox(height: 20),
              ButtonStyleFrom(
                isLoader: loading,
                onPressed: () {
                  loginUser(emailController.text, passwordController.text);
                },
                buttonText: "Login",
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forget password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser(String email, String password) async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setState(() {
          loading = false;
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
        });
      });
    }
  }
}
