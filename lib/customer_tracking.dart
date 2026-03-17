import 'package:fixmate/userCallPage.dart';
import 'package:fixmate/userChatPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerTrackingPage extends StatelessWidget {
  final String bookingId;

  const CustomerTrackingPage({Key? key, required this.bookingId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .doc(bookingId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());

          var data = snapshot.data!.data() as Map<String, dynamic>;

          // Retrieve coordinates from Firebase
          LatLng workerPos = LatLng(data['worker_lat'], data['worker_lng']);
          LatLng userPos = LatLng(data['user_lat'], data['user_lng']);

          return Stack(
            children: [
              // --- Flutter Map Layer ---
              FlutterMap(
                options: MapOptions(
                  initialCenter: workerPos,
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.fixmate',
                  ),
                  // Draw line between worker and user
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: [workerPos, userPos],
                        color: Colors.teal,
                        strokeWidth: 4,
                      ),
                    ],
                  ),
                  // Markers for User (Destination) and Worker (Car)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: userPos,
                        width: 40,
                        height: 40,
                        child: const Icon(
                            Icons.location_on, color: Colors.red, size: 40),
                      ),
                      Marker(
                        point: workerPos,
                        width: 80,
                        height: 80,
                        child: Transform.rotate(
                          angle: 0.5,
                          // You can calculate actual heading from Firebase if needed
                          child: const Icon(Icons.directions_car, color: Colors
                              .green, size: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // --- UI Overlays (Header & Bottom Panel) ---
              _buildHeader(),
              // Place this inside your Stack's children list
              Positioned(
                top: 50,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildBottomUI(context, data),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu, size: 30),
          // FixMate Logo Placeholder
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: const Text("FixMate", style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const Row(
            children: [
              Icon(Icons.storefront_outlined),
              SizedBox(width: 15),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomUI(BuildContext context, Map<String, dynamic> data) {
    // Added context here
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Your worker is coming in ${data['eta'] ?? '--'}",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Row(
            children: [
              const CircleAvatar(radius: 25, backgroundColor: Colors.grey),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['worker_name'] ?? "Saman",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Text("4.9 (531 reviews)",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Payment method"),
              Text("LKR ${data['price'] ?? '0.00'}", style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.teal.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: const [
                Icon(Icons.credit_card, color: Colors.indigo),
                SizedBox(width: 10),
                Text("**** **** **** 8970"),
                Spacer(),
                Text("12/26", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CallPage()),
                    );
                  },
                  child: const Text("Call"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  child: const Text(
                      "Message", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}