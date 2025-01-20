import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyThreeDotMenu extends StatelessWidget {
  const MyThreeDotMenu({super.key});

  void logout() {
    // get auth service
    final auth = AuthServices();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
      onSelected: (item) => onSelected(context, item),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: const Text("Settings"),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: const Text("Logout"),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      offset: Offset(0, 40),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingPage(),
          ),
        );
        break;
      case 1:
        logout();
        break;
    }
  }
}
