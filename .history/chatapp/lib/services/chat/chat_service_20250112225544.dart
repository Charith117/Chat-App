import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<void> sendMessage(String receiverID, String message) async {
    // get current your info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: cu,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    // construct chat room ID for the two users
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');


    // add new message to the database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }


// get messages
Stream<QuerySnapshot> getMessages(String userID,otherUserID){
  // construct chat room ID for the two users
  List<String> ids = [userID, otherUserID]; 
  ids.sort();
  String chatRoomID = ids.join('_');


   return _firestore
   .collection("chat_rooms")
   .doc(chatRoomID)
   .collection("messages")
   .orderBy("timestamp", descending: true)
   .snapshots();

}

}
