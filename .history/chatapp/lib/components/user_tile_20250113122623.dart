import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String profileImageUrl;
  final void Function()? onTap;
  final String chatId;

  const UserTile({
    super.key,
    required this.text,
    required this.profileImageUrl,
    required this.onTap,
    required this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            // User profile image
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            // user name
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: const Color.fromARGB(255, 30, 3, 1)),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').orderBy('timestamp', descending: true).limit(1).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final lastMessage = snapshot.data!.docs.first;
                        return Text(
                          lastMessage['text'],
                          style: TextStyle(color: Colors.grey),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
