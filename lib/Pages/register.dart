// import 'package:flutter/material.dart';
// import 'package:flutter_application_4/components/my_button.dart';
// import 'package:flutter_application_4/components/my_textfield.dart';

// //   final String hintText;
// //   final IconData icon;
// //   final bool obscureText;
// //   final TextEditingController controller;

// //   const MyTextField({
// //     super.key,
// //     required this.hintText,
// //     required this.icon,
// //     this.obscureText = false,
// //     required this.controller,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
// //       child: TextField(
// //         controller: controller,
// //         obscureText: obscureText,
// //         decoration: InputDecoration(
// //           enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               color: Theme.of(context).colorScheme.tertiary,
// //             ),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               color: Theme.of(context).colorScheme.inversePrimary,
// //             ),
// //           ),
// //           fillColor: Theme.of(context).colorScheme.secondary,
// //           filled: true,
// //           hintText: hintText,
// //           hintStyle: TextStyle(
// //             color: Theme.of(context).colorScheme.inversePrimary,
// //           ),
// //           prefixIcon: Icon(icon),
// //         ),
// //       ),
// //       );
// //   }
// // }

// class RegisterPage extends StatefulWidget {
//   final VoidCallback? onTap;
//   const RegisterPage({super.key, this.onTap});

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController nameController = TextEditingController();
//   // final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();
//   // final TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 50),

//               //logo
//               Icon(
//                 Icons.ramen_dining,
//                 size: 100,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//               const SizedBox(height: 25),
//               // Title
//               Text(
//               "Cas Food Delivery", 
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//             ),

//             const SizedBox(height: 10),
//               Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   color: Theme.of(context).colorScheme.inversePrimary,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 25),

//               // Name Input
//               MyTextField(
//                 icon: Icons.person,
//                 controller: nameController,
//                 hintText: "Name",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 10),

//               //email Input
//               MyTextField(
//                 icon: Icons.email,
//                 controller: nameController, 
//                 hintText: "Email",
//                 obscureText: false,
//               ),
//               const SizedBox(height: 10),

//               //password Input
//               MyTextField(
//                 icon: Icons.lock,
//                 controller: nameController, 
//                 hintText: "Password",
//                 obscureText: true,
//               ),
//               const SizedBox(height: 10),

//               //confirm password Input
//               MyTextField(
//                 icon: Icons.lock_outline,
//                 controller: nameController, // Use a different controller for confirm password
//                 hintText: "Confirm Password",
//                 obscureText: true,
//               ),
//               const SizedBox(height: 10),
              

//               // MyTextField(
//               //   controller: nameController,
//               //   hintText: "Name",
//               //   icon: Icons.person,
//               //   obscureText: false,
//               // ),
//               // const SizedBox(height: 10),
//               // MyTextField(
//               //   controller: emailController,
//               //   hintText: "Email",
//               //   icon: Icons.email,
//               //   obscureText: false,
//               // ),
//               // const SizedBox(height: 10),
//               // MyTextField(
//               //   controller: passwordController,
//               //   hintText: "Password",
//               //   icon: Icons.lock,
//               //   obscureText: true,
//               // ),
//               // const SizedBox(height: 10),
//               // MyTextField(
//               //   controller: confirmPasswordController,
//               //   hintText: "Confirm Password",
//               //   icon: Icons.lock_outline,
//               //   obscureText: true,
//               // ),
//               // const SizedBox(height: 10),

//               //register button
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//               //   child: GestureDetector(
//               //     onTap: () {
//               //       // Add registration logic here
//               //       // _register(context);
//               //     },
//               //     child: Container(
//               //       padding: const EdgeInsets.all(20),
//               //       decoration: BoxDecoration(
//               //         color: Theme.of(context).colorScheme.inversePrimary,
//               //         borderRadius: BorderRadius.circular(8),
//               //       ),
//               //       child: Center(
//               //         child: Text(
//               //           "Register",
//               //           style: TextStyle(
//               //             color: Theme.of(context).colorScheme.surface,
//               //             fontWeight: FontWeight.bold,
//               //             fontSize: 16,
//               //           ),
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // const SizedBox(height: 25),

//               // Already have an account? Login link
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Text(
//               //       "Already have an account? ",
//               //       style: TextStyle(
//               //         color: Theme.of(context).colorScheme.inversePrimary,
//               //         fontSize: 16,
//               //       ),
//               //     ),
//               //     GestureDetector(
//               //       onTap: () {
//               //         Navigator.pop(context,'/login');
//               //       },
//               //       child: Text(
//               //         "login",
//               //         style: TextStyle(
//               //           color: Theme.of(context).colorScheme.primary,
//               //           fontSize: 16,
//               //           fontWeight: FontWeight.bold,
//               //         ),
//               //       ),
//               //     ),
//               //   ],
//               // ),
//               MyButton(
//                 text: "Register",
//                 onTap: () {
//                 },
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Already have an account? ",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                       fontSize: 16,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, '/login'); 
//                     },
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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

