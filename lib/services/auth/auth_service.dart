import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //get the current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
    String email, password
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } 
    //errorand exceptions
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
    String name,email, password
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } 
    //error and exceptions
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
}