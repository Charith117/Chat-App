import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future <UserCredential> signInWithEmailPassword(String email,password) async {

    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  // sign up

  // errors
}
