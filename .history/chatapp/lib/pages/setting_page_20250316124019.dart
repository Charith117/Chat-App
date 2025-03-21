import 'package:chatapp/pages/account_page.dart';
import 'package:chatapp/pages/profile_page.dart';
import 'package:chatapp/services/profile/profile_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String? name;
  final String? bio;

  const SettingPage({super.key, this.name, this.bio});

  @override
  Widget build(BuildContext context) {
    final ProfileService profileService = ProfileService();
    return FutureBuilder<Map<String, dynamic>?>(
      future: profileService.fetchProfile(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    snapshot.data?['name'] ?? 'Unknown',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    snapshot.data?['bio'] ?? 'No bio available',
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ),
              _buildListTile(
                context,
                icon: Icons.person,
                title: 'Profile',
                subtitle: 'View and edit your profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()),
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
      },
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
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
