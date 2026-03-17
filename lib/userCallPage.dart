import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // --- 1. Header Row ---
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 28),
                  // FixMate Logo
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.person, color: Colors.white), // Placeholder for logo
                  ),
                  const Row(
                    children: [
                      Icon(Icons.storefront_outlined, size: 26),
                      SizedBox(width: 20),
                      Icon(Icons.shopping_cart_outlined, size: 26),
                    ],
                  ),
                ],
              ),
            ),

            // --- 2. Center Content (Profile) ---
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with Saman's image
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Saman karunaratne",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Calling....",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // --- 3. Bottom Action Buttons ---
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSmallActionBtn(Icons.speaker_phone_outlined),
                  _buildSmallActionBtn(Icons.mic_off_outlined),
                  // Main End Call / Accept Button
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.call, color: Colors.white, size: 35),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  _buildSmallActionBtn(Icons.videocam_outlined),
                  _buildSmallActionBtn(Icons.more_horiz),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for the smaller circular buttons
  Widget _buildSmallActionBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2F1), // Light mint green background
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black54, size: 24),
    );
  }
}