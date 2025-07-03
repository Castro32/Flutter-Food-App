// import 'package:flutter/material.dart';
// import 'package:flutter_application_4/components/my_button.dart';
// import 'package:flutter_application_4/components/my_textfield.dart';
// import 'package:flutter_application_4/Pages/home_page.dart';
// import 'package:flutter_application_4/services/auth/auth_service.dart';

// class LoginPage extends StatefulWidget {

//   final VoidCallback? onTap;

//   const LoginPage({super.key, this.onTap});

//   @override
//   State<LoginPage> createState() => _loginPage();
// }

// class _loginPage extends State<LoginPage>  {
//   // final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   //login method
//   void login () {
//     // auth
//     final _authService = AuthService();

//     try async { 
//       await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
//     };

//     catch (e) {
//       // Handle error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Login failed: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // home page nav
//     Navigator.push(
//       context, 
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Logo
//             Icon(
//               Icons.ramen_dining,
//               size: 100,
//               color: Theme.of(context).colorScheme.inversePrimary,
//             ),
//             const SizedBox(height: 25),

//             // App Name
//             Text(
//               "Cas Food Delivery", 
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//             ),

//             const SizedBox(height: 25),

//             // Email Input
//             MyTextField(
//               controller: emailController,
//               hintText: "Email",
//               obscureText: false,
//               icon: Icons.email,
//             ),

//             const SizedBox(height: 10),

//             // Password Input - Using custom widget
//             MyTextField(
//               controller: passwordController,
//               hintText: "Password",
//               obscureText: true,
//               icon: Icons.lock,
//             ),

//             const SizedBox(height: 10),

//             // Login Button
//             MyButton(
//               text: "Sign In",
//               onTap: login,
//             ),

//             const SizedBox(height: 10),

//             // Register Link
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Not a member? ",
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/register'); 
//                   },
//                   child: Text(
//                     "Register now",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ), 
//       ),
//     );
//   }

//   void _login(BuildContext context) {
//     // Add your login logic here
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
    
//     if (email.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill in all fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Add authentication logic here
//     print('Email: $email');
//     print('Password: $password');
    
//     //  success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Login successful!'),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   void _navigateToRegister(BuildContext context) {
//     // Navigate to register page
//     // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
//     print('Navigate to register page');
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/home_page.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/components/my_textfield.dart';
import 'package:flutter_application_4/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login method
  void login() async {
    //auth service instance
    final authService = AuthService();

    //validation
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields!",style: TextStyle(color: Colors.redAccent),)),
      );
      return;
    }

    //email validation
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email!",style: TextStyle(color: Colors.redAccent),)),
      );
      return;
    }

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    }
    //error and exceptions
    on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Login"),
          content: const Text("Login Successful!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text("OK", style: TextStyle(color: Colors.green)),
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
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
                "Sign In",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
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
              MyButton(
                text: "Sign In",
                onTap: login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register'); 
                    },
                    child: Text(
                      "Register now",
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