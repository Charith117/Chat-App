import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemYellow,
        title: Text('Home Page',
        style:TextStyle(
          fontSize:20,
          color: Colors.blue,
          
        ),),
      ),
    );
  }
}