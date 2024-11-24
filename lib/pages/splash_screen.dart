import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // TODO: Check login from local storage
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen'
        ),
      ),
    );
  }
}