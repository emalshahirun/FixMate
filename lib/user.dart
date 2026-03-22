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
// lib/pages/contact_us_page.dart
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsScaffold(
      title: "Contact Us",
      body: SizedBox(),
    );
  }
}
// lib/pages/contact_us_page.dart (updated)
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Contact Us",
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text("Contact us for complaints",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "Address: House# 72, Road# 21, maharagama-1213\nEmail: support@fixmate.com",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
// lib/pages/contact_us_page.dart (updated)
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';
import '../widgets/shared_widgets.dart';

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
            const Text("Contact us for complaints",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Address: House# 72, Road# 21, maharagama-1213\nEmail: support@fixmate.com",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            buildTextField("Name"),
            buildTextField("Email"),
            buildTextField("Write your text", maxLines: 5),
          ],
        ),
      ),
    );
  }
}
// lib/pages/contact_us_page.dart (updated — full file)
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';
import '../widgets/shared_widgets.dart';

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
            const Text("Contact us for complaints",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Address: House# 72, Road# 21, maharagama-1213\nEmail: support@fixmate.com",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            buildTextField("Name"),
            buildTextField("Email"),
            buildTextField("Write your text", maxLines: 5),
            const SizedBox(height: 20),
            buildBlueButton("Send Message", () {}),
          ],
        ),
      ),
    );
  }
}
// lib/pages/delete_account_page.dart
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsScaffold(
      title: "Delete Account",
      body: SizedBox(),
    );
  }
}
// lib/pages/delete_account_page.dart (updated — full file)
import 'package:flutter/material.dart';
import '../widgets/settings_scaffold.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Delete Account",
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Are you sure you want to delete your account? Deleting your account removes personal information from our database...",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text("Delete", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// lib/widgets/shared_widgets.dart (new file)
import 'package:flutter/material.dart';

Widget buildTextField(String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
// lib/widgets/shared_widgets.dart (updated)
import 'package:flutter/material.dart';

Widget buildTextField(String label, {bool obscure = false, int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      obscureText: obscure,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
// lib/widgets/shared_widgets.dart (updated)
import 'package:flutter/material.dart';

Widget buildTextField(String label, {bool obscure = false, int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      obscureText: obscure,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget buildBlueButton(String label, VoidCallback onPressed) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    ),
  );
}