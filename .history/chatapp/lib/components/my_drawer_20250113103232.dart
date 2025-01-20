import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  void logout() {
    // get auth service
    final auth = AuthServices();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Chat App'),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String value) {
            switch (value) {
              case 'home':
                // Navigate to home
                Navigator.popUntil(context, (route) => route.isFirst);
                break;
              case 'settings':
                // Navigate to settings
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
                break;
              case 'logout':
                // Logout
                logout();
                break;
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'home',
                child: Row(
                  children: [
                    Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    const Text('H O M E'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    const Text('S E T T I N G S'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 8),
                    const Text('L O G O U T'),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
