import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Themes/theme_provider.dart';
import 'package:flutter_application_4/firebase_options.dart';
import 'package:flutter_application_4/models/restaurant.dart';
import 'package:flutter_application_4/services/auth/auth_gate.dart';
import './Pages/login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './Pages/register.dart';
// import 'services/auth/log_reg.dart';
import './Pages/settings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
      ),
      //restaurant provider

      ChangeNotifierProvider<Restaurant>(
        create: (context) => Restaurant(),
      )
    ],
    child: const MyApp(),
    )
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
      // home: const LogReg(),
      home: const AuthGate(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}