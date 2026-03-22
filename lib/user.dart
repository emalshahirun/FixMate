import 'package:flutter/material.dart';

class SettingsScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const SettingsScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: body,
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Privacy Policy",
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Text(
          "Privacy Policy for FixMate...\n\nAt FixMate, accessible through our mobile application, one of our top priorities is ensuring the privacy and protection of our users' personal information. This policy explains the types of data collected...",
          style: TextStyle(height: 1.6, color: Colors.black87),
        ),
      ),
    );
  }
}
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Contact Us",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Contact us for complaints", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Address: House# 72, Road# 21, maharagama-1213\nEmail: support@pathao.com",
                textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            _buildTextField("Name"),
            _buildTextField("Email"),
            _buildTextField("Write your text", maxLines: 5),
            const SizedBox(height: 20),
            _buildBlueButton("Send Message", () {}),
          ],
        ),
      ),
    );
  }
}