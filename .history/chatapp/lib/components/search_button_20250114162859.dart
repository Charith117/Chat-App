import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/components/user_tile.dart'; // Added import for UserTile
import 'package:chatapp/services/auth/auth_services.dart'; // Import AuthServices

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
      onPressed: () {
        showSearch(
          context: context,
          delegate: UserSearchDelegate(),
        );
      },
    );
  }
}

class UserSearchDelegate extends SearchDelegate<String> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthServices _authService = AuthServices(); // Initialize AuthServices
  List<DocumentSnapshot> searchResults = [];

  void navigateToChatPage(BuildContext context, String uid) {
    close(context, '');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          receiverEmail:
              searchResults.firstWhere((doc) => doc['uid'] == uid)['email'],
          receiverID: uid,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          searchResults.clear();
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 50.0), // Added padding to the top of the chat tiles
          child: UserTile(
            name: searchResults[index]['name'],
            lastMessage: 'No messages yet',
            onTap: () {
              navigateToChatPage(context, searchResults[index]['uid']);
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final currentUserEmail = _authService.getCurrentUser()?.email;

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('chats')
          .where('participants', arrayContains: currentUserEmail)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          print('No suggestions found');
          return Text('No suggestions found');
        }
        searchResults = snapshot.data!.docs.where((doc) {
          return doc['participants'].contains(query) && doc['participants'].contains(currentUserEmail);
        }).toList();
        return ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0), // Added padding to the top of the chat tiles
              child: UserTile(
                name: searchResults[index]['name'],
                lastMessage: 'No messages yet',
                onTap: () {
                  navigateToChatPage(context, searchResults[index]['uid']);
                },
              ),
            );
          },
        );
      },
    );
  }
}
