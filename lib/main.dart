import 'package:flutter/material.dart';
import 'package:lodging_app/pages/auth/login_page.dart';
import 'package:lodging_app/pages/auth/register_page.dart';
import 'package:lodging_app/pages/detail_lodging/detail_lodging_page.dart';
import 'package:lodging_app/pages/get_started_page.dart';
import 'package:lodging_app/pages/home/home_page.dart';
import 'package:lodging_app/pages/splash_page.dart';
import 'package:lodging_app/providers/home_provider.dart';
import 'package:lodging_app/providers/search_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider())
      ],
      child: const LodgingApp(),
    ),
  );
}

class LodgingApp extends StatelessWidget {
  const LodgingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkBlueColor,
        ),
        scaffoldBackgroundColor: semiWhiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: semiWhiteColor,
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/detail-lodging': (context) => const DetailLodgingPage(),
      },
    );
  }
}
