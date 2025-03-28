import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream
  Stream<List<Map<String.dynamic>> getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshot))
  }

  // sen₫ messages

  // get messages
}
