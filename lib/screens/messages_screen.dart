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
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return ListTile(
          leading: Icon(Icons.message),
          title: Text('Pengirim: ${message['senderId']}'),
          subtitle: Text(message['content']),
        );
      },
    );
  }
}
