import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> fetchUserName() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userId = user.uid;
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        final String firstName = userDoc.get('firstName') ?? '';
        final String lastName = userDoc.get('lastName') ?? '';
        return '$firstName $lastName';
      } else {
        return '';
      }
    } else {
      throw Exception("User not authenticated");
    }
  } catch (e) {
    print('Error fetching user name: $e');
    return ''; // Return empty string in case of error
  }
}
