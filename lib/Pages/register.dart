import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/home_page.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/components/my_textfield.dart';
import 'package:flutter_application_4/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController(); 
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Registration method
  //Registration method with detailed debugging
void register() async {
  final authService = AuthService();

  // Trim whitespace from all inputs
  final email = emailController.text.trim();
  final password = passwordController.text.trim();
  final confirmPassword = confirmPasswordController.text.trim();
  final name = nameController.text.trim();

  // Debug: Print the email being used
  print('DEBUG: Email being used: "$email"');
  print('DEBUG: Email length: ${email.length}');
  print('DEBUG: Email characters: ${email.codeUnits}');

  // Check if fields are empty
  if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || name.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in all fields!")),
    );
    return;
  }

  bool isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

// Then in your register method, replace the basic validation with:
    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email address!")),
      );
      return;
    }


  // Check password length
  if (password.length < 6) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password must be at least 6 characters long!")),
    );
    return;
  }

  // Check if passwords match
  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Passwords do not match!")),
    );
    return;
  }

  try {
  print('DEBUG: Attempting to register with email: $email');
  
  // Create account first
  UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  
  print('DEBUG: Account created successfully!');
  
  // Then try to save additional data (optional)
  try {
    await _firestore.collection('userData').doc(userCredential.user!.uid).set({
      'userName': name,
      'email': email,
      'uid': userCredential.user!.uid,
      'createdAt': FieldValue.serverTimestamp(),
    }).timeout(const Duration(seconds: 5));
    
    print('DEBUG: User data saved to Firestore');
  } catch (firestoreError) {
    print('DEBUG: Firestore save failed, but account created: $firestoreError');
    // Continue with success - account is created
  }
  
  print('DEBUG: Registration successful!');
  
  // Show success dialog
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Register"),  
      content: const Text("Registration successful!"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const HomePage())
            ); 
          },
          child: const Text("OK"),
        ),
      ],
    ),
  );
} catch (e) {
  print('DEBUG: Registration error: $e');
  // Handle error...
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Icon(
                Icons.ramen_dining,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              Text(
                "Cas Food Delivery", 
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                icon: Icons.person,
                controller: nameController,
                hintText: "Name",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                icon: Icons.email,
                controller: emailController, 
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                icon: Icons.lock,
                controller: passwordController, 
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyTextField(
                icon: Icons.lock_outline,
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyButton(
                text: "Register",
                onTap: register,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login'); 
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

