import 'package:chatapp/pages/account_page.dart';
import 'package:chatapp/services/profile/profile_service.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileService _profileService = ProfileService();
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
          FutureBuilder(
            future: _profileService.fetchProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _buildProfileTile(context, snapshot.data);
              }
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

  Widget _buildProfileTile(BuildContext context, dynamic profileData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(profileData['profilePicture']),
        ),
        title: Text(profileData['name']),
        subtitle: Text(profileData['bio']),
      ),
    );
  }
}