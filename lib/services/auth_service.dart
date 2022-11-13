

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Login function


  // Register function
  Future registerUserWithEmailandPassword(String email, String fullName, String password) async {
    try {
        User user = (await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password)).user!;
    } on FirebaseAuthException catch(e)  {
      print(e);
    }
  }

  // Signup function
}