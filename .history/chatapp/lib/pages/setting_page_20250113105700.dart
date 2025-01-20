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
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Profile'),
              subtitle: Text('View and edit your profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.lock, color: Colors.blue),
              title: Text('Privacy'),
              subtitle: Text('Manage your privacy settings'),
              onTap: () {
                // Navigate to privacy settings page
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text('Notifications'),
              subtitle: Text('Notification preferences'),
              onTap: () {
                // Navigate to notifications settings page
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.help, color: Colors.blue),
              title: Text('Help & Support'),
              subtitle: Text('Get help and support'),
              onTap: () {
                // Navigate to help and support page
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.blue),
              title: Text('About'),
              subtitle: Text('Learn more about the app'),
              onTap: () {
                // Navigate to about page
              },
            ),
          ),
        ],
      ),
    );
  }
}