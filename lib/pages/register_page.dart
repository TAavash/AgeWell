import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/logo_box.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(
        context, '/register'); // Ensure you have '/register' route in your app
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing conntroller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user method
  void signUserUp() async {
    // Validate email format
    if (!emailController.text.endsWith('@gmail.com')) {
      showErrorMessage("Please use a Gmail address.");
      return;
    }

    // Check password length
    if (passwordController.text.length < 8) {
      showErrorMessage("Password should be at least 8 characters.");
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Check if passwords match
      if (passwordController.text == confirmPasswordController.text) {
        // Create user with Firebase
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        Navigator.pop(context); // Remove loading indicator
        showErrorMessage("Passwords don't match");
        return;
      }
      Navigator.pop(
          context); // Remove loading indicator after successful registration
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Remove loading indicator
      // Handle specific Firebase error codes
      switch (e.code) {
        case 'email-already-in-use':
          showErrorMessage("This email is already registered.");
          break;
        case 'weak-password':
          showErrorMessage("Password should be at least 8 characters.");
          break;
        case 'invalid-email':
          showErrorMessage("Please enter a valid email address.");
          break;
        default:
          showErrorMessage("An unexpected error occurred. Please try again.");
      }
    }
  }

  // wrong email dialog
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset:
          true, // Automatically resizes the body when the keyboard shows up
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //logo
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Create an account",
                style: TextStyle(color: Colors.grey[700], fontSize: 30),
              ),

              const SizedBox(
                height: 35,
              ),

              //email textfield
              MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 35,
              ),
              //password textfield
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 30,
              ),

              //confirmed password textfield
              MyTextfield(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 35,
              ),

              const SizedBox(
                height: 30,
              ),

              //sign in button
              MyButton(text: "Sign Up", onTap: signUserUp),

              const SizedBox(
                height: 50,
              ),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              // sign in options icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(
                      onTap: () async {
                        // await AuthService().signInWithGoogle();
                      },
                      imagePath: 'lib/images/google.png'),

                  const SizedBox(
                    width: 20,
                  ),

                  // facebook button
                  SquareTile(onTap: () {}, imagePath: 'lib/images/facebook.jpg')
                ],
              ),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
