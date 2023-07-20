import 'package:flutter/material.dart';
import 'package:news_app/bottom_nav_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEDE9FE),
      bottomNavigationBar: BottomNavBar(index: 1),
    );
  }
}