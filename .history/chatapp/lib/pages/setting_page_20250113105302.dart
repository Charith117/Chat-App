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
              // Navigate to profile page or perform any action
            },
          ),
          // Add more settings options here
        ],
      ),
    );
  }
}