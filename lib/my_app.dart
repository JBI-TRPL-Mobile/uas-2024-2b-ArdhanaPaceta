import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';  // Impor WelcomeScreen

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Welcome App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Menampilkan layar WelcomeScreen sebagai halaman awal
      home: WelcomeScreen(),
    );
  }
}
