// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   //instance of firebase auth
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   //get the current user
//   User? getCurrentUser() {
//     return _firebaseAuth.currentUser;
//   }

//   //sign in with email and password
//   Future<UserCredential> signInWithEmailAndPassword(
//     String email, password
//   ) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential;
//     } 
//     //errorand exceptions
//     on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }
//   //sign up with email and password
//   Future<UserCredential> signUpWithEmailAndPassword(
//     String name,email, password
//   ) async {
//     try {
//       UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       return userCredential;
//     } 
//     //error and exceptions
//     on FirebaseAuthException catch (e) {
//       throw Exception(e.code);
//     }
//   }

//   //sign out
//   Future<void> signOut() async {
//     try {
//       await _firebaseAuth.signOut();
//     } catch (e) {
//       throw Exception('Sign out failed: $e');
//     }
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
    String email, 
    String password
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
    String email, 
    String password,
    String name
  ) async {
    try {
      // Create user account
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Firestore
      await _saveUserDataToFirestore(userCredential.user!, name, email);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Save user data to Firestore
  Future<void> _saveUserDataToFirestore(User user, String name, String email) async {
    try {
      await _firestore.collection('userData').doc(user.uid).set({
        'userName': name,
        'email': email,
        'uid': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving user data: $e');
      throw Exception('Failed to save user data');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
}