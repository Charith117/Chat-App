import 'package:flutter/material.dart';

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
    // TODO: Implement search results
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Implement search suggestions
    return Container();
  }
}
