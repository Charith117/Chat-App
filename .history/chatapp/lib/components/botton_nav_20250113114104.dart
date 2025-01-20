import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CustomBottomNavBar(),
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Widget> _children = [
    HomePage(),
    CallPage(),
    UpdatesPage(),
    AddMorePage(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void onz