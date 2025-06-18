import 'package:flutter/material.dart';
import 'package:flutter_application_4/Themes/theme_provider.dart';
import './Pages/login.dart';
import 'package:provider/provider.dart';
import './Pages/register.dart';
import './auth/log_reg.dart';
import 'package:flutter_application_4/Pages/login.dart';
import 'package:flutter_application_4/Pages/register.dart';
import './Pages/settings.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // //home: LoginPage(),
      // home: RegisterPage(), //
      // routes: {
       
      // },
      home: const LogReg(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}