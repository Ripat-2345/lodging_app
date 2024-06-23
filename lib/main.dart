import 'package:flutter/material.dart';
import 'package:lodging_app/pages/auth/login_page.dart';
import 'package:lodging_app/pages/auth/register_page.dart';
import 'package:lodging_app/pages/auth/reset_password_page.dart';
import 'package:lodging_app/pages/auth/verify_forgot_password_page.dart';
import 'package:lodging_app/pages/detail_lodging/detail_lodging_page.dart';
import 'package:lodging_app/pages/get_started_page.dart';
import 'package:lodging_app/pages/home/home_page.dart';
import 'package:lodging_app/pages/splash_page.dart';
import 'package:lodging_app/providers/booking_provider.dart';
import 'package:lodging_app/providers/home_provider.dart';
import 'package:lodging_app/providers/lodging_provider.dart';
import 'package:lodging_app/providers/theme_provider.dart';
import 'package:lodging_app/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LodgingProvider>(
          create: (_) => LodgingProvider(),
        ),
        ChangeNotifierProvider<BookingProvider>(
          create: (_) => BookingProvider(),
        ),
      ],
      child: const LodgingApp(),
    ),
  );
}

class LodgingApp extends StatelessWidget {
  const LodgingApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkBlueColor,
        ),
        scaffoldBackgroundColor:
            themeProvider.themeApp ? semiWhiteColor : darkBlueColor,
        appBarTheme: AppBarTheme(
          backgroundColor:
              themeProvider.themeApp ? semiWhiteColor : darkBlueColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: themeProvider.themeApp ? darkBlueColor : blueColor,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: themeProvider.themeApp ? darkBlueColor : blueColor,
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const GetStartedPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/verify-forgot-password': (context) =>
            const VerifyForgotPasswordPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        '/home': (context) => const HomePage(),
        '/detail-lodging': (context) => const DetailLodgingPage(),
      },
    );
  }
}
