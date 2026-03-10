import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const HeroesDeSonrisaApp());

class HeroesDeSonrisaApp extends StatelessWidget {
  const HeroesDeSonrisaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Héroes de Sonrisa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFE74C3C)),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 20),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

