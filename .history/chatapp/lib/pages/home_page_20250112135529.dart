import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthServices _authService = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "homepage",
        ),
      ),
      drawer: const MyDrawer(),
      body: _builderUserList(),
    );
  }

  // build a list of users axcept for the current logged in user
  Widget _builderUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading.....");
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _builderUserListItem).toList(),
        );
      },
    );
  }

  // build the individual list tile for the user
  Widget _builderUserListItem(Map<String, dynamic> userData,BuildContext context) {
    // display a
  }
}
