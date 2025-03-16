import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/components/search_button.dart';
import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/pages/chat_page.dart' as chat_page;
import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:chatapp/services/profile/profile_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            onPressed: () {
              // Implement search functionality here
              showSearch(
                context: context,
                delegate: UserSearchDelegate(currentUserId: _authService.getCurrentUser()!.uid),
              );
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
    // Only show users that have chat history with current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return StreamBuilder<String?>(
        stream: _chatService.getLastMessage(userData['uid']),
        builder: (context, messageSnapshot) {
          // Only show users with chat history
          if (messageSnapshot.hasData && messageSnapshot.data != null) {
            return FutureBuilder<Map<String, dynamic>?>(
              future: _profileService.fetchProfile(userData['uid']),
              builder: (context, profileSnapshot) {
                if (profileSnapshot.hasData) {
                  return UserTile(
                    name: profileSnapshot.data!['name'] ?? 'Unknown',
                    lastMessage: messageSnapshot.data!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => chat_page.ChatPage(
                            receiverEmail:
                                profileSnapshot.data!['name'] ?? 'Unknown',
                            receiverID: userData['uid'],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            );
          }
          return Container(); // Hide users without chat history
        },
      );
    }
    return Container();
  }
}
