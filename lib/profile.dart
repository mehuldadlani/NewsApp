import 'package:flutter/material.dart';
import 'package:news_app/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}