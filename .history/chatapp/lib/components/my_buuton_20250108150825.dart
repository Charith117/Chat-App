import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Theme.of(context).colorScheme.
      ) ,
      child: Center(
        child: Text("Button"),
      ),

    );
  }
}