import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard_screen.dart'; // Import DashboardScreen
import 'sign_up_screen.dart'; // Import SignUpScreen

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<List<dynamic>> readUsersFromJson() async {
    String data = await rootBundle.loadString('data/users.json');
    return json.decode(data);
  }

  Future<bool> validateUser(String email, String password) async {
    List<dynamic> users = await readUsersFromJson();

    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        return true;
      }
    }
    return false;
  }

  void handleSignIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    bool isValid = await validateUser(email, password);

    if (isValid) {
      // Navigasi ke Dashboard jika login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleSignIn,
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigasi ke layar Sign-Up
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
