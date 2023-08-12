import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laren_program_app/ui/auth/splash_service.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAnimate = false;
  SplashService service = SplashService();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimate = true;
      });
      service.isLogin(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              top: isAnimate ? mq.height * .20 : -mq.height * .5,
              left: mq.width * .20,
              duration: const Duration(seconds: 2),
              child: Text(
                "Laren your program",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
            AnimatedPositioned(
              top: mq.height * 0.30,
              left: mq.width * .15,
              width: mq.width * .80,
              bottom: isAnimate ? mq.height * .30 : -mq.height * .5,
              duration: const Duration(seconds: 2),
              child: Image.asset("assets/images/learn.png"),
            ),
          ],
        ),
      ),
    );
  }
}
