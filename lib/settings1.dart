import 'package:fixmate/settings2,3.dart';
import 'package:fixmate/settings4,5,6,7.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        // Use your FixMate logo asset here
        title: Image.asset(
          'assets/logo.png',
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              "FixMate",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            );
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.storefront_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingsItem(context, "Change Password", ChangePasswordPage()),
          _buildSettingsItem(context, "Add Credit Card", AddCreditCardPage()),
          _buildSettingsItem(context, "Change Language", ChangeLanguagePage()),
          _buildSettingsItem(context, "Privacy Policy", PrivacyPolicyPage()),
          _buildSettingsItem(context, "Contact Us", ContactUsPage()),
          _buildSettingsItem(context, "Delete Account", DeleteAccountPage()),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    String title,
    Widget destination,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFB2DFDB),
        ), // Light teal border matching your UI
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
