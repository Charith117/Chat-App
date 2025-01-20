import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/pages/chat_page.dart';

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

  void navigateToChatPage(String uid) {
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
        return ListTile(
          title: Text(searchResults[index]['name']),
          onTap: () {
            // Assuming there's a function to navigate to a chat page with the user's ID
            // This is a placeholder for that function
            navigateToChatPage(searchResults[index]['uid']);
          },
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
            return ListTile(
              title: Text(searchResults[index]['name']),
              onTap: () {
                // Assuming there's a function to navigate to a chat page with the user's ID
                // This is a placeholder for that function
                navigateToChatPage(searchResults[index]['uid']);
              },
            );
          },
        );
      },
    );
  }
}
