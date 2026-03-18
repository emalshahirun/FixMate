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
        title: Image.asset('assets/logo.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.storefront_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSettingsItem("Change Password"),
          _buildSettingsItem("Add Credit Card"),
          _buildSettingsItem("Change Language"),
          _buildSettingsItem("Privacy Policy"),
          _buildSettingsItem("Contact Us"),
          _buildSettingsItem("Delete Account"),
        ],
      ),
    );
  }
  Widget _buildSettingsItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFB2DFDB)), // Light teal border
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        onTap: () {},
      ),
    );
  }
}