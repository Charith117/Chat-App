import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> updateProfile(String name, String bio) async {
    final String uid = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'bio': bio,
    });
  }

  Future<String> uploadProfilePicture(String filePath) async {
    final String uid = _auth.currentUser!.uid;
    final Reference reference = _storage.ref('profile_pictures/$uid');
    await reference.putFile(filePath);
    return await reference.getDownloadURL();
  }

  Future<void> updateProfilePicture(String url) async {
    final String uid = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(uid).update({
      'profilePicture': url,
    });
  }
}



