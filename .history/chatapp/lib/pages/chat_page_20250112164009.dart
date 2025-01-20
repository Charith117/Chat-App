import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;

  ChatPage({super.key,
  required this.receiverEmail});

  final TextEditingController _messageController = TextEditingController();

// chat and auth services

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
    );
  }
}
