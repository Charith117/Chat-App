import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
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
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').where('name', isEqualTo: query).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Text('No results found');
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            return ListTile(
              title: Text(document['name']),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').where('name', isEqualTo: query).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Text('No suggestions found');
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            return ListTile(
              title: Text(document['name']),
            );
          },
        );
      },
    );
  }
}
