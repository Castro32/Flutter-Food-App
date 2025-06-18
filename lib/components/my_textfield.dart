import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? icon;

  const MyTextField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.obscureText, 
    this.icon,
  });

  @override
  Widget build (BuildContext content){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(content).colorScheme.tertiary),
              borderRadius: BorderRadius.circular(8.0),
            ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(content).colorScheme.inversePrimary),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(content).colorScheme.inversePrimary,
          ),
          // prefixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}