import 'package:flutter/material.dart';
import 'package:chatapp/services/profile/profile_service.dart';

class ProfilePage extends StatelessWidget {
  final ProfileService _profileService = ProfileService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: _profileService.fetchProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No profile data available'));
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data?['name'] ?? 'Unknown'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(snapshot.data?['profilePicture'] ?? 'https://via.placeholder.com/150'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    snapshot.data?['name'] ?? 'Unknown',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    snapshot.data?['bio'] ?? 'No bio available',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}



