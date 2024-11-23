import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late String name;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    name = args['name'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Column(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage("https://akcdn.detik.net.id/community/media/visual/2022/12/25/lionel-messi_169.jpeg?w=600&q=90"),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => Navigator.pop(context, true), 
                child: const Text("Back to Home")
              )
            ],
          ),
        ],
      ),
    );
  }
}