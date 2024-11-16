import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/components/counter_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.red, width: 5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.outlined(
                    onPressed: () {}, 
                    icon: const Icon(Icons.add),
                  ),
                  TextButton.icon(
                    onPressed: () {}, 
                    iconAlignment: IconAlignment.end,
                    label: const Text('Login'),
                    icon: const Icon(Icons.login),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: OutlinedButton.icon(
                onPressed: () {}, 
                iconAlignment: IconAlignment.end,
                label: const Text('Login'),
                icon: const Icon(Icons.login),
              ),
            ),
            FilledButton.tonalIcon(
              onPressed: () {}, 
              iconAlignment: IconAlignment.end,
              label: const Text('Login'),
              icon: const Icon(Icons.login),
            ),
            FilledButton.icon(
              onPressed: () {}, 
              iconAlignment: IconAlignment.end,
              label: const Text('Login'),
              icon: const Icon(Icons.login),
            ),
            ElevatedButton.icon(
              onPressed: () {}, 
              iconAlignment: IconAlignment.start,
              label: const Text('Login'),
              icon: const Icon(Icons.login),
            ),
            Container(
              color: Colors.grey,
              child: Image.network(
                "https://akcdn.detik.net.id/community/media/visual/2022/12/25/lionel-messi_169.jpeg?w=600&q=90",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.grey,
              child: Image.asset(
                "assets/icon.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            CounterWidget(
              counter: _counter,
              description: "Nomor:",
              onPressed: _incrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}
