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
          Card(
        child: ListTile(
          leading: Icon(Icons.person, color: Colors.blue),
          title: Text('Profile'),
          subtitle: Text('View and edit your profile'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
            );
          },
        ),
          ),
          Card(
        child: ListTile(
          leading: Icon(Icons.lock, color: Colors.blue),
          title: Text('Privacy'),
          subtitle: Text('Manage your privacy settings'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to privacy settings page
          },
        ),
          ),
          Card(
        child: ListTile(
          leading: Icon(Icons.notifications, color: Colors.blue),
          title: Text('Notifications'),
          subtitle: Text('Notification preferences'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to notifications settings page
          },
        ),
          ),
          Card(
        child: ListTile(
          leading: Icon(Icons.help, color: Colors.blue),
          title: Text('Help & Support'),
          subtitle: Text('Get help and support'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to help and support page
          },
        ),
          ),
          Card(
        child: ListTile(
          leading: Icon(Icons.info, color: Colors.blue),
          title: Text('About'),
          subtitle: Text('Learn more about the app'),
          trailing: Icon(Icons.arrow_forward_ios),
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