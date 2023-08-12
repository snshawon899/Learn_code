import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/model/user_model.dart';
import 'package:laren_program_app/ui/register/login_screen.dart';

import '../widgets/button_style.dart';
import '../widgets/from_widget_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome To Sign UP",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              FromFieldWidgets(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter name";
                  }
                },
                text: "Full Name",
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
                  if (val?.isEmpty ?? true) {
                    RegExp regExp = RegExp(r'^.{6,}$');
                    if (val?.isEmpty ?? true) {
                      return "Please enter password";
                    }
                    if (!regExp.hasMatch(val!)) {
                      return "Please enter a valid password(Min 6 Character)";
                    }
                  }
                },
                obscureText: true,
                text: "**********",
              ),
              const SizedBox(height: 20),
              ButtonStyleFrom(
                isLoader: isLoader,
                onPressed: () {
                  register(emailController.text, passwordController.text);
                },
                buttonText: "SignUP",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Already have an account!",
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
                          builder: (_) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
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

  Future<void> register(String email, String password) async {
    if (fromKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setState(() {
          isLoader = false;
        });
        addDataFirebase();
      }).onError((error, e) {
        print(error);
      });
    }
  }

  Future<void> addDataFirebase() async {
    User? user = auth.currentUser!;
    UserModel userModel = UserModel();
    userModel.uid = user.uid;
    userModel.email = emailController.text;
    userModel.name = nameController.text;

    await firestore.collection("users").doc(user.uid).set(
          userModel.toMap(),
        );
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }
}
