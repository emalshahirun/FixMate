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