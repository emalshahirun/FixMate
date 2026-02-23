import 'dart:async';
import 'package:flutter/material.dart';
import 'onboard_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 3 seconds then go to Onboarding
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

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
          child: Image.asset('assets/logo.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}
