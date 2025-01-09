import 'package:flutter/material.dart';
import 'sign_in_screen.dart';  // Import SignInScreen
import 'sign_up_screen.dart';  // Import SignUpScreen

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
                // Navigasi ke SignInScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                );
              },
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.blue,
              ),
            ),

            SizedBox(height: 20),

            // Tombol Sign Up
            ElevatedButton(
              onPressed: () {
                // Navigasi ke SignUpScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
