import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/logo_box.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context); // Remove loading circle
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Remove loading circle
      showErrorMessage(getErrorMessage(e.code));
    }
  }

  String getErrorMessage(String code) {
    switch (code) {
      case "user-not-found":
        return "Incorrect Email. User not found.";
      case "wrong-password":
        return "Incorrect Password. Please try again.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: null, // Ensure this is not adding an unwanted widget
        // persistentFooterButtons: null, // Check for this
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.elderly,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 50),
                Text(
                  "Welcome to Revolutionizing Elder Care",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  isPasswordField: false,
                ),
                const SizedBox(height: 16),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  isPasswordField: true,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // forgot password functionality
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                MyButton(text: "Sign In", onTap: signUserIn),
                const SizedBox(height: 24),
                const Text("Or continue with"),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/images/google.png',
                      onTap: () async {
                        await AuthService().signInWithGoogle();
                      },
                    ),
                    const SizedBox(width: 16),
                    SquareTile(
                      imagePath: 'lib/images/facebook.jpg',
                      onTap: () {
                        // TODO: Implement Facebook sign in
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
