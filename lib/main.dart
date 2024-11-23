import 'package:flutter/material.dart';
import 'package:flutter_nusacodes_2/consts/colors.dart';
import 'package:flutter_nusacodes_2/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.notoSerif(
            color: Colors.black,
            fontSize: 22,
          ),
          iconTheme: const IconThemeData(
            color: Colors.yellow
          )
        ),
        iconTheme: const IconThemeData(
          color: Colors.orange,
          size: 40
        )
      ),
      home: const SplashScreen(),
    );
  }
}
