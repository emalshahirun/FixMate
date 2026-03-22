// lib/widgets/settings_scaffold.dart
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
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}

// lib/widgets/settings_scaffold.dart (updated)
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
// lib/pages/privacy_policy_page.dart
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsScaffold(
      title: "Privacy Policy",
      body: SizedBox(),
    );
  }
}
// lib/pages/privacy_policy_page.dart (updated)
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

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