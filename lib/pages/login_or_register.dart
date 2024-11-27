import 'package:flutter/material.dart';
import 'package:project/pages/register_page.dart';
import 'login_page.dart';

//import 'login_screen.dart';

class LoginOrRegsiterPage extends StatefulWidget {
  const LoginOrRegsiterPage({super.key});

  @override
  State<LoginOrRegsiterPage> createState() => _LoginOrRegsiterPageState();
}

class _LoginOrRegsiterPageState extends State<LoginOrRegsiterPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
