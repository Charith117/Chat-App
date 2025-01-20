import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final String profileImageUrl;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.profileImageUrl,
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
              radius: 30,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            // user name
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: const Color.fromARGB(255, 30, 3, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
