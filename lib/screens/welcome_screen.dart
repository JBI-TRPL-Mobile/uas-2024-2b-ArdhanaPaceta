import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar di atas
            Image.asset('assets/logo.jpg', width: 200, height: 200),

            SizedBox(height: 50),

            // Tombol Sign In
            ElevatedButton(
              onPressed: () {
                // Aksi tombol Sign In
              },
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.blue, // Menggunakan backgroundColor
              ),
            ),

            SizedBox(height: 20),

            // Tombol Sign Up
            ElevatedButton(
              onPressed: () {
                // Aksi tombol Sign Up
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.green, // Menggunakan backgroundColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
