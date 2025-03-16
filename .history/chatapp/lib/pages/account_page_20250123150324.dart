// import 'dart:io';
import 'dart:typed_data';

import 'package:chatapp/services/profile/profile_service.dart';
import 'package:chatapp/utils.dart';
// import 'package:your_correct_package_name/utils.dart';
import 'package:flutter/material.dart';
// import 'package:your_correct_package_name/services/profile/profile_service.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List? image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final ProfileService _profileService = ProfileService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundImage: MemoryImage(_image!),
                        )
                      :
                  CircleAvatar(
                    radius: 70,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        // final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bioController,
              decoration: const InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save profile changes
                _profileService.updateProfile(
                    _nameController.text, _bioController.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
