// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//  LoginPage({super.key});

//   @override 
//   Widget build (BuildContext context){
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             //logo
//             Icon(
//               Icons.lock_open_rounded,
//               size: 100,
//               color: Theme.of(context).colorScheme.inversePrimary,
//               ),
//             const SizedBox(height: 25),

//             Text("Cas Delivery App", style: TextStyle(
//               fontSize: 16,
//               color: Theme.of(context).colorScheme.inversePrimary,
//             )),

//             const SizedBox(height: 25),

//             //email input
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 hintText: "Email",
//               ),
//               obscureText: false,
//             ),

//             const SizedBox(height: 25),

//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 hintText: "Password",
//               ),
//               obscureText: false,
//             ),

//             const SizedBox(height: 25),


//           ],
//         ) 
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_4/components/my_button.dart';
import 'package:flutter_application_4/components/my_textfield.dart';
import 'package:flutter_application_4/Pages/home_page.dart';

// Custom TextField Widget
// class MyTextfield extends StatelessWidget {
//   final TextEditingController controller;
  
//   final String hintText;
//   final bool obscureText;
//   final IconData? icon;
  

//   // const MyTextfield({
//   //   super.key, 
//   //   required this.controller, 
//   //   required this.hintText, 
//   //   required this.obscureText, 
//   //   this.icon,
//   // });

//   @override
//   Widget build(BuildContext context) { // Fixed: context parameter name
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Theme.of(context).colorScheme.tertiary),
//             ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Theme.of(context).colorScheme.inversePrimary),
//           ),
//           fillColor: Theme.of(context).colorScheme.secondary,
//           filled: true,
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: Theme.of(context).colorScheme.inversePrimary,
//           ),
//           prefixIcon: icon != null ? Icon(icon, color: Theme.of(context).colorScheme.inversePrimary) : null,
//         ),
//       ),
//     );
//   }
// }

// Login Page
class LoginPage extends StatefulWidget {

  final VoidCallback? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _loginPage();
}

class _loginPage extends State<LoginPage>  {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login method
  void login () {
    // auth

    // home page nav
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.ramen_dining,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            // App Name
            Text(
              "Cas Food Delivery", 
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Email Input
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
              icon: Icons.email,
            ),

            const SizedBox(height: 10),

            // Password Input - Using custom widget
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
              icon: Icons.lock,
            ),

            const SizedBox(height: 10),

            // Login Button
            MyButton(
              text: "Sign In",
              onTap: login,
            ),

            const SizedBox(height: 10),

            // Register Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), 
      ),
    );
  }

  void _login(BuildContext context) {
    // Add your login logic here
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Add authentication logic here
    print('Email: $email');
    print('Password: $password');
    
    //  success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login successful!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _navigateToRegister(BuildContext context) {
    // Navigate to register page
    // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
    print('Navigate to register page');
  }
}