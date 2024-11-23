import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final names = [
    "Lionel Messi",
    "Ronaldo",
    "Neymar",
    "Kaka"
  ];

  var index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            names[index],
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () async {
              final result = await Navigator.pushNamed(
                context, 
                AppRoutes.profile,
                arguments: {
                  "name": names[index]
                }
              );
              if(result != null) {
                if(result == true) {
                  setState(() {
                    if(index == 3) {
                      index = 0;
                    } else {
                      index++;
                    }
                  });
                }
              }
            }, 
            child: const Text("Open Profile Page"),
          ),
        ],
      ),
      
    );
  }
}
