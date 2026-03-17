import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'arrivedPage.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key, required String bookingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location")),
      body: Stack(
        children: [
          // 1. The Map Layer
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(6.9271, 79.8612),
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.fixmate',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(6.9271, 79.8612),
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.location_pin,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 2. The "Arrived" Button Layer
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0), // Padding from the bottom
              child: SizedBox(
                width: double.infinity, // Makes button full width
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E), // Dark blue to match your UI
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to ArrivedPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkerArrivalPage()),
                    );
                  },
                  child: const Text(
                    "Arrived at Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

