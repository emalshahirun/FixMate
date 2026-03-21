import 'package:flutter/material.dart';

class WorkerBookingsPage extends StatelessWidget {
  const WorkerBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FE),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "My Bookings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Upcoming"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookingList("Upcoming"),
            _buildBookingList("Completed"),
            _buildBookingList("Cancelled"),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList(String status) {
    // Mock Data - In a real app, filter your Firebase list by 'status'
    List<Booking> dummyBookings = [
      Booking(
        customerName: "Sarah See",
        service: "Repair Leaky Faucet",
        date: "Dec 18, 2025",
        time: "10:30 AM",
        price: "LKR 250.00",
        status: "Upcoming",
      ),
      Booking(
        customerName: "John Doe",
        service: "Electrical Wiring",
        date: "Dec 15, 2025",
        time: "02:00 PM",
        price: "LKR 1500.00",
        status: "Completed",
      ),
    ].where((b) => b.status == status).toList();

    if (dummyBookings.isEmpty) {
      return const Center(child: Text("No bookings found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dummyBookings.length,
      itemBuilder: (context, index) {
        final booking = dummyBookings[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    booking.service,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    booking.price,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(booking.customerName),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text("${booking.date} at ${booking.time}"),
                ],
              ),
              const SizedBox(height: 16),
              if (status == "Upcoming")
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to your WorkerArrivalPage
                        },
                        child: const Text("View Details"),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class Booking {
  final String customerName;
  final String service;
  final String date;
  final String time;
  final String price;
  final String status; // Upcoming, Completed, Cancelled

  Booking({
    required this.customerName,
    required this.service,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
  });
}
