import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_page.dart' as chat_page;
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:chatapp/services/profile/profile_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthServices _authService = AuthServices();
  final ProfileService _profileService = ProfileService();

  List<Map<String, dynamic>> _allUsers = []; // Store all users

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "ChatApps",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor),
            onPressed: () {
              // Implement camera functionality here
            },
          ),
          MyThreeDotMenu(),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: _builderUserList()),
        ],
      ),
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

        // Store all users
        if (snapshot.data != null) {
          _allUsers = snapshot.data as List<Map<String, dynamic>>;
        }

        // return list view
        if (snapshot.data == null ||
            snapshot.data is! List<Map<String, dynamic>>) {
          print("No users found or data is not in the expected format");
          return const Text("No users found");
        }
        var users = snapshot.data as List<Map<String, dynamic>>;
        print("User: $users");
        return ListView(
          children: _allUsers
              .map<Widget>(
                  (userData) => _builderUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build the individual list tile for the user
  Widget _builderUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display all user except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return FutureBuilder<Map<String, dynamic>>(
        future: _profileService
            .fetchProfile(userData['uid'])
            .then((profile) => profile ?? {'name': 'Unknown'}),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return FutureBuilder<String?>(
              future: _profileService.getLastMessage(userData['uid']),
              builder: (context, messageSnapshot) {
                // Check if there are messages before displaying 'No messages'
                if (messageSnapshot.data == null) {
                  return UserTile(
                    name: snapshot.data!['name'],
                    lastMessage: "no",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chat_page.ChatPage(
                            receiverEmail: userData['email'],
                            receiverID: userData['uid'],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return UserTile(
                    name: snapshot.data!['name'],
                    lastMessage: messageSnapshot.data!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chat_page.ChatPage(
                            receiverEmail: userData['email'],
                            receiverID: userData['uid'],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          } else {
            return const Text('No data');
          }
        },
      );
    } else {
      return Container();
    }
  }
}
