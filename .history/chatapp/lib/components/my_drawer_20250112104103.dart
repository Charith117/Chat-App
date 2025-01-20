import 'package:chatapp/auth/auth_services.dart';
import 'package:chatapp/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

   void logout() {
    // get auth  service
    final _auth = AuthServices();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),

              // home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                    title: Text("H O M E"),
                    leading: Icon(Icons.home,
                        color: Theme.of(context).colorScheme.primary),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),

              // setting list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                    title: Text("S E T T I N G S"),
                    leading: Icon(Icons.settings,
                        color: Theme.of(context).colorScheme.primary),
                    onTap: () {
                      Navigator.pop(context);
                      // navigate to the setting page
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingPage(),
                          ));
                    }),
              ),
            ],
          ),

          // logout tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
