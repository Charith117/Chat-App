import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
