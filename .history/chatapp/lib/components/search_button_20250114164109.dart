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
    close(context, '');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          final userDoc = searchResults.firstWhere(
            (doc) => doc.data().containsKey('uid') && doc['uid'] == uid,
            orElse: () => null,
          );
          if (userDoc != null) {
            return ChatPage(
              receiverEmail: userDoc['email'],
              receiverID: uid,
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: Text('Error')),
              body: Center(child: Text('User not found')),
            );
          }
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
        final userDoc = searchResults[index];
        if (userDoc.data().containsKey('uid')) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 50.0), // Added padding to the top of the chat tiles
            child: UserTile(
              name: userDoc['name'],
              lastMessage: 'No messages yet',
              onTap: () {
                navigateToChatPage(context, userDoc['uid']);
              },
            ),
          );
        } else {
          return Container();
        }
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
            final userDoc = searchResults[index];
            final userData = userDoc.data() as Map<String, dynamic>;
            if (userData.containsKey('uid')) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 10.0), // Added padding to the top of the chat tiles
                child: UserTile(
                  name: userData['name'],
                  lastMessage: 'No messages yet',
                  onTap: () {
                    navigateToChatPage(context, userDoc['uid']);
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        );
      },
    );
  }
}
