import 'package:flutter/material.dart';
import 'package:funds/screens/homeScreen.dart';
import 'package:funds/screens/phoneLoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funds',
      theme: ThemeData(
        fontFamily: 'Infra',
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey,
          background: Colors.black,
          surface: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'Infra',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Infra',
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Infra',
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Infra',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        useMaterial3: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 12)))),
      ),
      home: PhoneLoginPage(),
    );
  }
}
