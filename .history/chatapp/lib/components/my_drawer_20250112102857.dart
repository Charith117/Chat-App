import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(Icons.message,
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
              leading: Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
            ),
          ),



          // setting list tile
           Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.S, color: Theme.of(context).colorScheme.primary),
            ),
          ),

          // logout tile
        ],
      ),

    );
  }
}