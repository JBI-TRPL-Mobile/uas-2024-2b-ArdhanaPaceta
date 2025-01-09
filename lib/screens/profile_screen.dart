import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _user;

  Future<void> _loadUser() async {
    final String response = await rootBundle.loadString('data/users.json');
    final data = await json.decode(response);
    setState(() {
      _user = data[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/ardha.jpg'), // Ganti dengan foto profil
          ),
          SizedBox(height: 20),
          Text(
            _user!['username'],
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(_user!['email']),
        ],
      ),
    );
  }
}
