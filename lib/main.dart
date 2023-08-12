import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laren_program_app/ui/screens/splash_screen.dart';

late Size mq;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LearnApp());
}

class LearnApp extends StatelessWidget {
  const LearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
