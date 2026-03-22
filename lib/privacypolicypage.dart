import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Privacy Policy for FixMate",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Text(
                "FixMate ensures the privacy and protection of users’ personal information.",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),

              SizedBox(height: 16),
              Text(
                "Information We Collect",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                "We may collect user data such as name, contact details, and service usage.",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),

              SizedBox(height: 16),
              Text(
                "How We Use Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                "Collected data is used to improve services and provide better experience.",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),

              SizedBox(height: 16),
              Text(
                "Scope",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text(
                "This policy applies only to online data collected via the app.",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
