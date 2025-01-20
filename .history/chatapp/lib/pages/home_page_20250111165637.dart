import 'package:chatapp/auth/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    // get auth  service
    final _auth = AuthServices();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
            "homepage",
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
          'Drawer Header',
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 24,
          ),
              ),
            ),
            ListTile(
              leading: Icon(
          Icons.home,
          color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text('Home'),
              onTap: () {
          Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.secondary,
              ),
              title: Text('Settings'),
              onTap: () {
          Navigator.pop(context);
              },
            ),
          ],
        ),

        
      ),
    );
  }
}
