// import 'package:chatapp/pages/account_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildListTile(
            context,
            icon: Icons.person,
            title: 'Profile',
            subtitle: 'View and edit your profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
          _buildListTile(
            context,
            icon: Icons.lock,
            title: 'Privacy',
            subtitle: 'Manage your privacy settings',
            onTap: () {
              // Navigate to privacy settings page
            },
          ),
          _buildListTile(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Notification preferences',
            onTap: () {
              // Navigate to notifications settings page
            },
          ),
          _buildListTile(
            context,
            icon: Icons.help,
            title: 'Help & Support',
            subtitle: 'Get help and support',
            onTap: () {
              // Navigate to help and support page
            },
          ),
          _buildListTile(
            context,
            icon: Icons.info,
            title: 'About',
            subtitle: 'Learn more about the app',
            onTap: () {
              // Navigate to about page
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}