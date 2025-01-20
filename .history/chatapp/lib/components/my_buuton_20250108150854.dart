import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Theme.of(context).colorScheme.secondary,
      ) ,
      padding: EdgeInsets.all(value),
      child: Center(
        child: Text("Button"),
      ),

    );
  }
}