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

  // send messages

  // get messages
// send message
Future<void> sendMessage(String chatId, Map<String, dynamic> message) async {
  await _firestore.collection("Chats").doc(chatId).collection("Messages").add(message);
}

// get messages
Stream<List<Map<String, dynamic>>> getMessages(String chatId) {
  return _firestore.collection("Chats").doc(chatId).collection("Messages").orderBy('timestamp').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  });
}
}