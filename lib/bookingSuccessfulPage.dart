import 'package:flutter/material.dart';
import 'MainNavigation.dart';

class BookingSuccessfulPage extends StatelessWidget {
  const BookingSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.green, child: Icon(Icons.check, color: Colors.white, size: 50)),
            const SizedBox(height: 20),
            const Text("Booking Successful !", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 15),
            const Text(
              "Dear Harry Styles, you have successfully scheduled booking of Plumber for the upcoming date 12 Dec. Our service provider will contact you soon.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade200), borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(color: Colors.grey[300], height: 60, width: 60, child: const Icon(Icons.person)),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Plumber", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("1 hr • Includes dummy info", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
              const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigation(userType: '',)), // your bottom nav screen
                        (route) => false,
                  );
                },
                child: const Text("Proceed", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
           