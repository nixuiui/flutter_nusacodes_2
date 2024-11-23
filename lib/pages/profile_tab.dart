import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Profile Tab"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://akcdn.detik.net.id/community/media/visual/2022/12/25/lionel-messi_169.jpeg?w=600&q=90"),
              ),
              SizedBox(height: 8),
              Text(
                "Salaman",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}