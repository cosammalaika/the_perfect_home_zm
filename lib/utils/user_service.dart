// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider {
  static Future<String> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        // Check if the user document exists
        if (snapshot.exists) {
          String firstName = snapshot.data()!['firstName'];
          String lastName = snapshot.data()!['lastName'];
          return '$firstName $lastName';
        } else {
          return "User document does not exist";
        }
      } else {
        return "User not authenticated";
      }
    } catch (e) {
      return "Error fetching user details";
    }
  }

  static String userName = ''; // Initialize userName
  
}
void signUserIn(BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    //pop the loading circle
    // Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    // Handle FirebaseAuthException
    if (e.code == 'user-not-found') {
      // Show snackbar or dialog indicating user not found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User not found'),
        ),
      );
    } else if (e.code == 'wrong-password') {
      // Show snackbar or dialog indicating wrong password
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong password'),
        ),
      );
    } else {
      // Show snackbar or dialog indicating other FirebaseAuthException
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.message}'),
        ),
      );
    }
  } catch (e) {
    // Handle other exceptions
    // Show snackbar or dialog indicating other exceptions
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: ${e.toString()}'),
      ),
    );
  }
}

void genericErrorMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4D4D4D),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}