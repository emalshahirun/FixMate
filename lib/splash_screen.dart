import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The deep purple/blue background color from your image
      backgroundColor: const Color(0xFF3F51B5),
      body: Center(
        child: SizedBox(
          width: 300, // Adjust size as needed
          height: 300,
          // PATH TO YOUR IMAGE ASSET
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
