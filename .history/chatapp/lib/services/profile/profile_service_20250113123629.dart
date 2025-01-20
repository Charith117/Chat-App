import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateProfile(String name, String bio) async {
    final String uid = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'bio': bio,
    });
  }
}


