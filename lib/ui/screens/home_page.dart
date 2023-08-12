import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:laren_program_app/model/user_model.dart';

import 'package:laren_program_app/ui/register/login_screen.dart';
import 'package:laren_program_app/ui/screens/c++_code/c++_page.dart';
import 'package:laren_program_app/ui/screens/flutter_code/flutter_page.dart';
import 'package:laren_program_app/ui/screens/java_script_code/java_script_page.dart';
import 'package:laren_program_app/ui/screens/python_code/python_page.dart';

import '../widgets/program_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  FirebaseFirestore userStore = FirebaseFirestore.instance;

  @override
  void initState() {
    userStore.collection("users").doc(user!.uid).get().then(
      (value) {
        this.userModel = UserModel.fromMap(value.data());
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${userModel.name}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "${userModel.email}",
              style: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("setting"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Share"),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    logout();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Logout",
                        style: GoogleFonts.poppins(),
                      ),
                      const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProgramWidgets(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const FlutterChoiceCode(),
                        ),
                      );
                    },
                    img: "assets/images/flutter.png"),
                ProgramWidgets(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PythonCodeSolveVideo(),
                        ),
                      );
                    },
                    img: "assets/images/python.png"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProgramWidgets(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CPlusCodeSolveVideo(),
                        ),
                      );
                    },
                    img: "assets/images/c++.png"),
                ProgramWidgets(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JavaScriptCodeVideo(),
                        ),
                      );
                    },
                    img: "assets/images/java.png"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }
}
