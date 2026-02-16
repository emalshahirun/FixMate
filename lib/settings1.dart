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
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 16),
          label: const Text("Back", style: TextStyle(color: Colors.grey, fontSize: 16)),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3, // Highlight Settings
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }