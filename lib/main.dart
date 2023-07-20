import 'package:flutter/material.dart';
import 'package:news_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xffEDE9FE),
        hintColor: Color(0xffEDE9FE),
      ),
    );
  }
}