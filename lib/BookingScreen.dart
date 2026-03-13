import 'package:fixmate/worker_tracking.dart';
import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text("FixMate",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: const [
          Icon(Icons.storefront_outlined, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.shopping_cart_outlined, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF222222),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Bookings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Status: On the Way",
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          color: Colors.white70, size: 16),
                      SizedBox(width: 5),
                      Text("ETA: 15 min",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Active Bookings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildActiveCard(
                      context,
                      "Plumbing",
                      "Faucet Leaky",
                      "Mark Johnson",
                      "Track Plumber",
                      Colors.blue),
                  _buildActiveCard(context, "Electrical", "Install Fan",
                      "Sarah Lee", "Reschedule", Colors.blue,
                      hasCancel: true),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Past Jobs",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),

            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildPastJobCard("Electrical Issue", "David Chen", "Oct 26"),
                _buildPastJobCard("Shelf Installation", "David Chen", "Oct 19",
                    showActions: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveCard(BuildContext context, String title, String sub,
      String name, String btnText, Color btnCol,
      {bool hasCancel = false}) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(sub, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Text("Status: On Way",
              style: TextStyle(fontSize: 12, color: Colors.grey)),

          const Spacer(),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {

                    // ONLY TRACK BUTTON OPENS MAP
                    if (btnText == "Track Plumber") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const WorkerTrackingPage(bookingId: "booking1"),
                        ),
                      );
                    }

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btnCol,
                      foregroundColor: Colors.white),
                  child: Text(btnText, style: const TextStyle(fontSize: 11)),
                ),
              ),
              if (hasCancel) ...[
                const SizedBox(width: 5),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Cancel",
                        style: TextStyle(fontSize: 11)),
                  ),
                )
              ]
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPastJobCard(String title, String name, String date,
      {bool showActions = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 25, backgroundColor: Colors.grey),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(name, style: const TextStyle(color: Colors.grey)),
                  Text("Completed on $date",
                      style:
                      const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
          if (showActions) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Repeat Booking"))),
                const SizedBox(width: 8),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Leave Review"))),
              ],
            )
          ]
        ],
      ),
    );
  }
}