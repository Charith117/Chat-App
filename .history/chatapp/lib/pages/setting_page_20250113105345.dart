import 'package:chatapp/pages/account_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting page'),
      ),
      body: ListView(
        children: [
          ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
        subtitle: Text('View and edit your profile'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountPage()),
          );
        },
          ),
          // Add more settings options here
        ],
      ),
    );
  }
}