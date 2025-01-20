import 'package:chatapp/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(), // Added light mode theme
    home: HomePage(), // Changed home to directly open HomePage
  ));
}

// Removed CustomBottomNavBar and related classes as they are not needed anymore
