import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
    );
  }
}
