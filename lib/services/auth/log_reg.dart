import 'package:flutter/material.dart';
import 'package:flutter_application_4/Pages/login.dart';
import 'package:flutter_application_4/Pages/register.dart';

class LogReg extends StatefulWidget{
  
  const LogReg({super.key});
  
  

  @override
  State<LogReg> createState() => _LogRegState();
}

class _LogRegState extends State<LogReg> {

  bool isLogin = true;

  void togglePages() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (isLogin){
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap : togglePages);
    }
}
}