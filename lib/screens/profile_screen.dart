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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Log Out'),
        content: Text('Log Out from Learnout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implementasi log out
              Navigator.of(context).pop();
              // Mungkin arahkan ke layar login atau lakukan aksi lainnya
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar( // 
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Menghilangkan tombol back
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Hapus bagian judul "Profile" di bawah ini jika tidak diinginkan
          // Text(
          //   'Profile',
          //   style: TextStyle(
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.blue,
          //   ),
          // ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/ardha.jpg'), // Ganti dengan foto profil
          ),
          SizedBox(height: 20),
          Text(
            _user!['username'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(_user!['email']),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                Divider(),
                ListTile(
                  title: Text('Ganti Password'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Aksi untuk Ganti Password
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Privasi Akun'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Aksi untuk Privasi Akun
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Edit Profil'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Aksi untuk Edit Profil
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Privacy Center'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Aksi untuk Privacy Center
                  },
                ),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              onPressed: _showLogoutDialog,
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
