import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Text("N E W S    A P P", style: TextStyle(fontSize: 30, fontFamily: GoogleFonts.poppins().fontFamily),),
        ],
      ),
      nextScreen: NewsScreen(),
      splashIconSize: 100,
      duration: 1000,
      backgroundColor: Color(0xffEDE9FE),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}