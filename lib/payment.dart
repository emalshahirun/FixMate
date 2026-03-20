import 'package:fixmate/paymentSuccess2.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase Firestore

class PaymentOptionPage extends StatefulWidget {
  const PaymentOptionPage({super.key});

  @override
  State<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  String selectedMethod = "Visa";
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  void _confirmBooking() async {
    // Firebase logic to save the booking
    final bookingData = {
      'date': dateController.text,
      'time': timeController.text,
      'method': selectedMethod,
      'amount': 1500,
      'status': 'Success',
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Replace 'bookings' with your Firestore collection name
    await FirebaseFirestore.instance.collection('bookings').add(bookingData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Option"),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current location",
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              "2972 Westheimer Rd. Santa Ana, Illinois",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                hintText: "Date",
                border: OutlineInputBorder(),
              ),
            ),
