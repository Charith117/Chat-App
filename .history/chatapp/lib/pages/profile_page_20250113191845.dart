import 'package:chatapp/pages/account_page.dart';
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
              title: Center(child: Text(snapshot.data?['name'] ?? 'Unknown', style: TextStyle(fontSize: 24))),
              centerTitle: true,
              backgroundColor: Colors.purple, // Changed color to purple
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the column
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(snapshot.data?['profilePicture'] ?? 'https://via.placeholder.com/150'),
                    ),
                    const SizedBox(height: 30),
                    Center(child: Text(
                      snapshot.data?['name'] ?? 'Unknown',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )), // Center the name text
                    // const SizedBox(height: 5),
                    Center(child: Text(
                      snapshot.data?['bio'] ?? 'No bio available',
                      style: TextStyle(
                        decorationColor: Colors.black,
                        fontSize: 18,
                      ),
                    )), // Center the bio text
                    const SizedBox(height: 20),
                    Center(child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AccountPage()),
                        );
                      },
                      child: Text('Edit Profile', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Changed color to purple
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                    )), // Center the edit profile button
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

