import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
          // user is logged in
            if(snapshot.hasData){
              return const HOmePage(),
              
            }

          // user is Not Logged in


        }
        ),
    );
  }
}