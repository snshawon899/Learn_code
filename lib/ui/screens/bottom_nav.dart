import 'package:flutter/material.dart';
import 'package:laren_program_app/ui/screens/home_page.dart';
import 'package:laren_program_app/ui/screens/profile_page.dart';

class NavBottomBar extends StatefulWidget {
  const NavBottomBar({super.key});

  @override
  State<NavBottomBar> createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  int currentIndex = 0;
  List page = [
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(4, 4),
              color: Colors.black.withOpacity(.4),
            ),
          ],
          borderRadius: BorderRadiusDirectional.circular(50),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
