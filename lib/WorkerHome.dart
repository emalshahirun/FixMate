import 'package:flutter/material.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your FixMate logo asset
            const Icon(Icons.build_circle, color: Colors.blue, size: 30),
            const SizedBox(width: 8),
            const Text("FixMate", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.storefront_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- DARK HEADER: CURRENT JOB ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF2D2D2D), // Dark grey background
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "WELCOME BACK,\nSAMAN!",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with worker image
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Current Job", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text(
                    "Repair Leaky Faucet",
                    style: TextStyle(color: Colors.lightBlueAccent, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("Status: On the Way", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.white70, size: 18),
                      SizedBox(width: 5),
                      Text("123 Oak St, Sarah Cpt 4A", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.white70, size: 18),
                      SizedBox(width: 5),
                      Text("ETA: 15 min", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Navigate", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            // --- AVAILABLE JOBS SECTION ---
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Available Jobs", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildJobCard("Electrical Issue", Icons.bolt, Colors.purple),
                  _buildJobCard("Broken pipe", Icons.plumbing, Colors.black87),
                  _buildJobCard("Shelf Install", Icons.handyman, Colors.blueGrey),
                ],
              ),
            ),

            // --- EARNINGS OVERVIEW ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)],
                ),
                child: Column(
                  children: [
                    const Text("Earnings Overview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 5),
                    const Text(
                      "LKR 34,500",
                      style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Text("This Week's Earnings", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(String title, IconData icon, Color iconColor) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: iconColor),
          const SizedBox(height: 15),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey),
              Text(" Near you", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}