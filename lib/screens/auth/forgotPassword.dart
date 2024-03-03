// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_perfect_home_zm/theme/color.dart';
import 'package:the_perfect_home_zm/widgets/my_buttom.dart';
import 'package:the_perfect_home_zm/widgets/my_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}); // Corrected super.key to Key? key

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Corrected dispose method signature
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset(BuildContext context) async {
    String message = '';
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      message = 'Password reset email sent successfully. check your email';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found with this email.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address.';
      } else {
        message =
            'Error occurred while sending password reset email: ${e.message}';
      }
    } catch (e) {
      message = 'Error occurred while sending password reset email: $e';
    }

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Password Reset"), // Wrap text with const
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'), // Wrap text with const
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
                const SizedBox(height: 50),
                //welcome back you been missed

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Enter your Email and we will send you a password reset link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: secondary,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                //username
                MyTextField(
                  controller: _emailController, // Corrected controller
                  hintText: 'email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                //sign in button
                MyButton(
                  onTap: () => passwordReset(
                      context), // Pass context to passwordReset method
                  text: 'Reset Password',
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
