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
    Widget _builderUserList(){
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].username),
                );
          );
    }

}
