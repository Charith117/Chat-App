import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("User").snapshots().map((snapshot) {
      print("Fetched ${snapshot.docs.length} users from Firestore");
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();
        print("User data: $user");
        // return user
        return user;
      }).toList();
    });
  }


// send message
Future<void> sendMessage[String receiverID,message] asyn

// get messages

}