import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;

  ChatPage({super.key,
  required this.receiverEmail});

  final TextEditingController _messageController = TextEditingController();

// chat and auth services
final ChatService _chatService = ChatService();
final Auth


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
    );
  }
}
