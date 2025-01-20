import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/components/user_tile.dart'; // Added import for UserTile

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
  List<DocumentSnapshot> searchResults = [];

  void navigateToChatPage(BuildContext context, String uid) {
    // Close the search and navigate to the ChatPage with the selected user's details
    close(context, '');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          // Find the document with the matching uid to get the email
          final selectedUser = searchResults.firstWhere((doc) => doc['uid'] == uid);
          return ChatPage(
            receiverEmail: selectedUser['email'],
            receiverID: uid,
          );
        },
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
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('users')
          .where('name', isEqualTo: query)
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
        searchResults = snapshot.data!.docs;
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
