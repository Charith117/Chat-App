import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Theme.of(context).colorScheme.secondary,
      ) ,
      padding: EdgeInsets.all(20),
      ma
      child: Center(
        child: Text("Button"),
      ),

    );
  }
}