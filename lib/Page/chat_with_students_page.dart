import 'package:flutter/material.dart';

class ChatWithStudentsPage extends StatelessWidget {
  const ChatWithStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with Students"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Chat with Students Page",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
