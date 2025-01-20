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
          

          // logout tile
           Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),

    );
  }
}