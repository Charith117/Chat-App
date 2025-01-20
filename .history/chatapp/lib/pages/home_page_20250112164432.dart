import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_page.dart';
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

  // build a list of users accept for the current logged in user
  Widget _builderUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return const Text("Error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading.....");
        }

        // return list view
        if (snapshot.data == null || snapshot.data is! List<Map<String, dynamic>>) {
          print("No users found or data is not in the expected format");
          return const Text("No users found");
        }
        var users = snapshot.data as List<Map<String, dynamic>>;
        print("User: $users");
        return ListView(
          children: users.map<Widget>((userData) => _builderUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  // build the individual list tile for the user
  Widget _builderUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all user except current user
    if(userData["email"] != _authService.getCurrentUser()!.email){
      return UserTile(
      text:userData['email'],
      onTap: (){
         // tapped to the go user go to the chat page
      Navigator.push(context,MaterialPageRoute(builder:(context)=>ChatPage(
        receiverEmail: userData['email'],
        receiverID: userData,
      ),
        ),
       );
      },
     
    );
    }
    else{
      return Container();
    }
  }
}