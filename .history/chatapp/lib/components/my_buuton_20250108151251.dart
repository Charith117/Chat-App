import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final 
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(3)
      ) ,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Text("Button"),
      ),

    );
  }
}