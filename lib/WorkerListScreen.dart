import 'package:flutter/material.dart';
import 'PaymentOption1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerListScreen extends StatelessWidget {
  final String categoryTitle;
  const WorkerListScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text(categoryTitle, style: const TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: Colors.black),
        ),

        // 🔥 STREAM BUILDER (REALTIME DATA)
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('workers')
              .where('category', isEqualTo: categoryTitle) // filter
              .snapshots(),

          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("No workers found"));
            }

            final workers = snapshot.data!.docs;

            return ListView.builder(
              itemCount: workers.length,
              itemBuilder: (context, index) {
                var worker = workers[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D2D2D),
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
                            Text(worker['name'],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),

                            Text(worker['category'],
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12)),

                            Text(worker['location'],
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentOptionPage(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3F51B5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),

                        child: const Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    }
}
