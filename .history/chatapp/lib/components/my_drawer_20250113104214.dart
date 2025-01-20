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
          child: Row(
            children: [
              Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              const Text("H O M E"),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              const Text("S E T T I N G S"),
            ],
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              const Text("L O G O U T"),
            ],
          ),
        ),
      ],
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingPage(),
          ),
        );
        break;
      case 2:
        logout();
        break;
    }
  }
}
// To call this code in your home page, you can include the MyThreeDotMenu widget in the AppBar actions of your Scaffold.

i
  }
}