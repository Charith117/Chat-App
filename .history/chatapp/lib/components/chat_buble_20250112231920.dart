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
  final bool ;

  const ChatBubble({super.key, required this.message, required this.});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color:  ? Colors.blue[300] : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:  ? const Radius.circular(12) : Radius.zero,
            bottomRight:  ? Radius.zero : const Radius.circular(12),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color:  ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}