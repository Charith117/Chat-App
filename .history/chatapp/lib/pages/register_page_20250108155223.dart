import 'package:chatapp/components/my_buuton.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _compasswordController = TextEditingController();

   RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

      // Register function
      void register(){};

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
              height: 20,),
            // register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have account ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),),
                  HEs(
                    child: Text("Login Now",
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),),
                  ),
                ],

              )

          ],
        ),
      ),
    );
  }
}