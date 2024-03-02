import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          print("User document does not exist for UID: ${user.uid}");
          return "User document does not exist";
        }
      } else {
        print("User not authenticated");
        return "User not authenticated";
      }
    } catch (e) {
      print("Error fetching user details: $e");
      return "Error fetching user details";
    }
  }

  static String userName = ''; // Initialize userName
}
