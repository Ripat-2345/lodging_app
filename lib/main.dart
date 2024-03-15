import 'package:flutter/material.dart';
import 'package:lodging_app/pages/auth/login_page.dart';
import 'package:lodging_app/pages/auth/register_page.dart';
import 'package:lodging_app/pages/get_started_page.dart';
import 'package:lodging_app/pages/home/home_page.dart';
import 'package:lodging_app/pages/splash_page.dart';

void main() {
  runApp(const LodgingApp());
}

class LodgingApp extends StatelessWidget {
  const LodgingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
