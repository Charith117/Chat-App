import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID
  final String message;
  final Timestamp timestamp;


  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,

  });

  // conver to the map

  Map<String, dynamic> toMap(){
    return
  }
}
