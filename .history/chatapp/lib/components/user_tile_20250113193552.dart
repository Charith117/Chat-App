import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.onTap,
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
              // backgroundImage: NetworkImage(profileImageUrl),
            ),
            // user name and last message
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: const Color.fromARGB(255, 30, 3, 1)),
                  ),
                  Text(
                    lastMessage,
                    style: TextStyle(color: const Color.fromARGB(255, 30, 3, 1)),
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
