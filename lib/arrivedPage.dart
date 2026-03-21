import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'WorkerHome.dart';
import 'userCallPage.dart';

class WorkerArrivalPage extends StatelessWidget {
  const WorkerArrivalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: Column(
        children: [
          /// --- 1. Top Header & Map Area ---
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Background Map
                FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(6.9271, 79.8612),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.fixmate',
                    ),
                  ],
                ),

                // Dark Overlay
                Container(color: Colors.black.withOpacity(0.6)),

                // Custom Back Button (Redirects to Worker Home)
                Positioned(
                  top: 50,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                // Header Icons (Logo, Store, Cart)
                _buildTopIcons(),

                // Arrival Header Text
                _buildArrivalHeader(),
              ],
            ),
          ),

          /// --- 2. Action Buttons Section ---
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  _buildBlueButton(
                    icon: Icons.phone_in_talk,
                    label: "Call Now",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CallPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildWhiteButton(
                    icon: Icons.notifications_none,
                    label: "Send 'I'm Here' Alert",
                  ),
                ],
              ),
            ),
          ),

          /// --- 3. Job Details Bottom Sheet ---
          _buildJobDetailsPanel(context),
        ],
      ),
    );
  }

  /// --- HEADER ICONS WIDGET ---
  Widget _buildTopIcons() {
    return Positioned(
      top: 50,
      left: 70, // Shifted right to avoid back button
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // FixMate Logo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "FixMate",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Row(
            children: [
              Icon(Icons.storefront_outlined, color: Colors.white),
              SizedBox(width: 15),
              Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  /// --- ARRIVAL HEADER WIDGET ---
  Widget _buildArrivalHeader() {
    return const Positioned(
      top: 130,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            "You Have Arrived",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Let the customer know you're here",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// --- JOB DETAILS PANEL ---
  Widget _buildJobDetailsPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Job Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Repair Leaky Faucet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "123 Oak St, Apt 4A",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Navigate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// --- HELPER: BLUE BUTTON ---
  Widget _buildBlueButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// --- HELPER: WHITE BUTTON ---
  Widget _buildWhiteButton({required IconData icon, required String label}) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// --- PLACEHOLDER FOR HOME PAGE ---
class WorkerHomePage extends StatelessWidget {
  const WorkerHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Worker Home Page")));
  }
}
