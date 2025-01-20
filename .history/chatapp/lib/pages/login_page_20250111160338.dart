import 'package:chatapp/components/my_buuton.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//tap to go to the register page
   final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    // loging function
    void login() async {
      // get  auth serve
    }
    ;

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
              controller: _emailController,
            ),

            const SizedBox(
              height: 10,
            ),
            // pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(
              height: 10,
            ),
            // login button
            MyButton(
              text: "Login",
              onTap: login,
            ),

            const SizedBox(
              height: 20,
            ),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not aMember?  ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
