import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final TextEditingController _messageController = TextEditingController();

// chat and auth services
  final ChatService _chatService = ChatService();
  final AuthServices _authServices = AuthServices();

// send message

  void _sendMessage() async {
    // if these is something inside the textfile
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // display the all messages
          Expanded(
            child: _buildMessageList(),
          ),

          // display user input
          _buildUserInput(),
        ],
      ),
    );
  }

  // build the message list

  Widget _buildMessageList() {
    String senderID = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          // errors
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }

          // loadings
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading ...");
          }

          //returns list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _builderMessageItem(doc))
                .toList(),
          );
        });
  }

  // build message items
  Widget _builderMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        data['senderID'] == _authServices.getCurrentUser()!.uid;

    //  align messages to the right  if sender is the current user,otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? cCossAxisAlignment.end :CrossAxisAlignment.start,
        children: [
          Text(data["message"]),
        ],
      ));
  }

  // user inputs
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,
          ),
        ),

        // send button
        IconButton.filled(
            onPressed: _sendMessage, icon: const Icon(Icons.arrow_upward))
      ],
    );
  }
}
