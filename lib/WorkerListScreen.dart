import 'package:flutter/material.dart';

class WorkerListScreen extends StatelessWidget {
  final String categoryTitle;
  const WorkerListScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    // Fake Worker Data
    final List<Map<String, String>> workers = [
      {"name": "T. Sanjaya Nilanka Peiris", "location": "Moratuwa"},
      {"name": "P.G. Jayatissa", "location": "Matale"},
      {"name": "W. Premasiri Silva", "location": "Moratuwa"},
      {"name": "M.A. Alex Prasanna Perera", "location": "Moratuwa"},
      {"name": "Manoj Pushpakumara", "location": "Moratuwa"},
      {"name": "P.A. Muditha Priyankara", "location": "Moratuwa"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(categoryTitle, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF2D2D2D), // Dark background from your screenshot
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(workers[index]['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(categoryTitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                      Text(workers[index]['location']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F51B5), // Blue color
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: const Text("Book Now", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
