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
        title: Center(
          child: Text(
            "homepage",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),

      darwer :Dr
    );
  }
}
