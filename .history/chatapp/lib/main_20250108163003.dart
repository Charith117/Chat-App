import 'package:chatapp/auth/login_or_register.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/register_page.dart';
import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginOrRegister(),
      theme: lightMode,
    );
  }
}
