
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
 const HomePage({super.key});

// // chat & auth services
//   final ChatService _chatService = ChatService();
//   final AuthServices _authService = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            "homepage",
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // _chatService.sendMessage("Hello");
              },
              child: Text("Send Message"),
            ),
            ElevatedButton(
              onPressed: () {
                // _authService.signOut();
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
