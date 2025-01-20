import 'package:chatapp/components/chat_buble.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

  const ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  // chat and auth services
  final ChatService _chatService = ChatService();

  final AuthServices _authServices = AuthServices();

  // send message
  void _sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();

      // scroll to the bottom
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: _buildMessageList(),
          ),

          // display user input
          _buildUserInput(context),
        ],
      ),
    );
  }

  // build the message list
  Widget _buildMessageList() {
    String senderID = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(widget.receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading ...");
        }

        // returns list view
        return ListView(
          controller: _scrollController,
          children: snapshot.data!.docs
              .map((doc) => _builderMessageItem(doc))
              .toList(),
        );
      },
    );
  }

  // build message items
  Widget _builderMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        data['senderID'] == _authServices.getCurrentUser()!.uid;

    // align messages to the right if sender is the current user, otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data['message'], isCurrentUser: isCurrentUser, onDelete: () {
            _chatService.deleteMessage(doc.id);
          }),
          
        ],
      ),
    );
  }

  // user inputs
  Widget _buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type a message",
              obscureText: false,
            ),
          ),

          // send button
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 10.0),
            child: IconButton.filled(
              onPressed: _sendMessage,
              icon: const Icon(Icons.arrow_upward),
            ),
          )
        ],
      ),
    );
  }
}
