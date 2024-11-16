import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  String name = "Niki";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile $name'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.settings)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.more_vert)
          ),
        ],
      ),
      body: const Center(child: Text("Hello")),
    );
  }
}