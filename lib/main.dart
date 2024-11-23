import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/consts/colors.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusacodes Batch 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: ColorCustom.primary,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: routes,
    );
  }
}
