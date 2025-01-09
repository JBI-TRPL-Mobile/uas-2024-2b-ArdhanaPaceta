import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Notification {
  final String title;
  final String content;
  final String timestamp;

  Notification({required this.title, required this.content, required this.timestamp});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      title: json['title'],
      content: json['content'],
      timestamp: json['timestamp'],
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Notification> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    try {
      final String response = await rootBundle.loadString('data/notifications.json');
      final List<dynamic> data = json.decode(response);
      setState(() {
        notifications = data.map((json) => Notification.fromJson(json)).toList();
      });
    } catch (e) {
      print("Error loading notifications: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // Menambahkan ini untuk menghilangkan tombol back
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/notifications'); // Navigasi ke layar Notifications
            },
          ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(notification.content),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            notification.timestamp,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
