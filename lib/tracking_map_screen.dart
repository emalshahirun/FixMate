import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrackingMapScreen extends StatelessWidget {
  final String bookingId;

  const TrackingMapScreen({super.key, required this.bookingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .doc(bookingId)
            .snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!.data() as Map<String, dynamic>;

          double lat = data['technicianLat'];
          double lng = data['technicianLng'];

          return FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(lat, lng),
              initialZoom: 15,
            ),
            children: [

              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: "com.example.fixmate",
              ),

              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(lat, lng),
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.build,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}