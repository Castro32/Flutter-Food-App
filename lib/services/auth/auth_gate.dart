import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/home_page.dart';
import 'package:flutter_application_4/services/auth/log_reg.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // User is signed in
            return const HomePage();
          } else {
            // User is not signed in
            // return const Center(child: Text('User is not signed in'));
            return const LogReg();
          }
        },
        ),
    );
  }
}