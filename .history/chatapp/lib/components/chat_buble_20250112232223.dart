import 'package:flutter/material.dart';

class ChatBubbleScaffold extends StatelessWidget {
  const ChatBubbleScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue[300] : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: isCurrentUser ? const Radius.circular(12) : Radius.zero,
              bottomRight: isCurrentUser ? Radius.zero : const Radius.circular(12),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isCurrentUser ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}