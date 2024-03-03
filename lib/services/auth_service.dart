// ignore_for_file: implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google sign in
  signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credentials for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //sign in!
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static void genericErrorMessage(BuildContext context, message) {}

  static void signUserUp({required String email, required String password, required String firstName, required String lastName, required int phoneNumber, required Null Function(dynamic message) onError, required Null Function() onSuccess}) {}
}
