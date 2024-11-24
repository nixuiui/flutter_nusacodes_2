import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Tab"),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.tabNavigation), 
              child: const Text("Tab Navigation")
            ),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.counter), 
              child: const Text("Counter")
            )
          ],
        )
      ),
    );
  }
}