import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/components/counter_widget.dart';
import 'package:flutter_nusacodes_2/helpers/helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
      body: Center(
        child: Column(
          children: [
            Text(
              "Luas Segitiga: ${luasSegitiga(10, 8)}",
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const CounterWidget(
              counter: 10,
              description: "Nomor:",
            ),
          ],
        ),
      ),
    );
  }
}