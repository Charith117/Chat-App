// import 'package:chatapp/components/image_capture.dart';
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

  // Add a controller for the search input
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _allUsers = []; // Store all users
  List<Map<String, dynamic>> _filteredUsers = []; // Store filtered users

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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ImageCapture()),
              // );
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
            onPressed: () {
              // Implement search functionality here
              _filterUsers();
            },
          ),
          MyThreeDotMenu(),
        ],
      ),
      // drawer: const MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Removed TextField for search input
          Expanded(child: _builderUserList()),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  void _filterUsers() async {
    String query = _searchController.text.toLowerCase();
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + 'z')
        .get();
    final QuerySnapshot snapshotEmail = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: query + 'z')
        .get();
    _filteredUsers = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList() +
        snapshotEmail.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
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
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Text("Loading.....");
        // }

        // Store all users for filtering
        if (snapshot.data != null) {
          _allUsers = snapshot.data as List<Map<String, dynamic>>;
          _filteredUsers = _allUsers; // Initialize filtered users
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
          children: _filteredUsers
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

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Implement search functionality
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Implement search suggestions
    return Container();
  }
}
