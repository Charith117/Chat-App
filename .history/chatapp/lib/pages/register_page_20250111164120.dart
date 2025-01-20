import 'package:chatapp/auth/auth_services.dart';
import 'package:chatapp/components/my_buuton.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _compasswordController = TextEditingController();

  // tap function
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Register function
    void register() {
      // get auth service
      final _auth = AuthServices();
      
      
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
              "Lets create account for you",
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
            // Confirm pw textfield
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _compasswordController,
            ),

            const SizedBox(
              height: 20,
            ),
            // login button
            MyButton(
              text: "Register",
              onTap: register,
            ),

            const SizedBox(
              height: 20,
            ),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have account ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
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
