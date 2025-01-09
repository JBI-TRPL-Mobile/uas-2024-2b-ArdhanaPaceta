import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<dynamic> _messages = [];

  Future<void> _loadMessages() async {
    final String response = await rootBundle.loadString('data/messages.json');
    final data = await json.decode(response);
    setState(() {
      _messages = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Menyembunyikan tombol back
      ),
      body: _messages.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Displaying the sender's image
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(message['imageUrl']),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pengirim: ${message['senderId']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  message['content'],
                                  style: TextStyle(fontSize: 14.0),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Waktu: ${message['timestamp']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
