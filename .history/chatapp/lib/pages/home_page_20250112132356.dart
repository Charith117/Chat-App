import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// chat & auth services
final ChatService
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(
          child: Text(
        "homepage",
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
