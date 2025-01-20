import 'package:flutter/material.dart';

class ChatBubbleScaffold extends StatelessWidget {
  const ChatBubbleScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 chat bubbles for demonstration
        itemBuilder: (context, index) {
          return ChatBubble(
            message: "Message $index",
            isCurrentUser:
                true, // Assuming all messages are from the current user for demonstration
            onDelete: () {
              // Add delete functionality here
              print('Deleting message $index');
            },
          );
        },
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final VoidCallback onDelete;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue[300] : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  isCurrentUser ? const Radius.circular(12) : Radius.zero,
              bottomRight:
                  isCurrentUser ? Radius.zero : const Radius.circular(12),
            ),
          ),
          child: Stack(
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isCurrentUser ? Colors.white : Colors.black,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: onDelete,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
