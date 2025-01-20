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

  void navigateToChatPage(BuildContext context, DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>;
    
    // Check if email exists, otherwise use a default value
    final email = userData['name'];
    
    // Close search
    close(context, '');
    
    // Navigate with null checks
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          receiverEmail: email,
          receiverID: userDoc.id,
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
        final userDoc = searchResults[index];
        final userData = userDoc.data() as Map<String, dynamic>;
        
        return Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: UserTile(
            name: userData['name'] ?? 'Unknown',
            lastMessage: 'No messages yet',
            onTap: () => navigateToChatPage(context, userDoc),
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
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return const Text('No suggestions found');
        }
        
        searchResults = snapshot.data!.docs;
        return ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            final userDoc = searchResults[index];
            final userData = userDoc.data() as Map<String, dynamic>;
            
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: UserTile(
                name: userData['name'] ?? 'Unknown',
                lastMessage: 'No messages yet',
                onTap: () => navigateToChatPage(context, userDoc),
              ),
            );
          },
        );
      },
    );
  }
}
