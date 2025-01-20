import 'package:chatapp/components/my_buuton.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // loging function
    void login(){};

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),
            // welcome back message
            Text(
              "Welcome Back, you've been missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            // email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _passwordController,
            ),

            const SizedBox(
              height: 20,
            ),
            // pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _emailController,
            ),

            const SizedBox(
              height: 20,
            ),
            // login button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(
              height: 20,),
            // register now
              Row(
                mainAxis
                children: [
                  Text("Not aMember?"),
                  Text("Register Now"),
                ],

              )

          ],
        ),
      ),
    );
  }
}
