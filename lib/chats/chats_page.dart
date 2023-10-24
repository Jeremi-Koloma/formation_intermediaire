import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatsPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ChatsPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
