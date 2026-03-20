import 'package:flutter/material.dart';

import 'PayBookingSuccess3.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(color: Colors.white, borderRadius: 
BorderRadius.circular(20)),
                child: Column(
                  children: [
                    const CircleAvatar(radius: 30, backgroundColor: Colors.blue, child: Icon(Icons.check, color: Colors.white, size: 40)),
                    const SizedBox(height: 10),
                    const Text("Great", style: TextStyle(color: Colors.blue)),
                    const Text("Payment Success", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(height: 40),
                    _receiptRow("Payment Mode", "Master card"),
                    _receiptRow("Total Amount", "LKR 1500"),
                    _receiptRow("Pay Date", "Apr 10, 2022"),
                    _receiptRow("Pay Time", "10:45 am"),
                    const SizedBox(height: 20),
                    const Text("Total Pay", style: TextStyle(color: Colors.grey)),
                    const Text("LKR 1500", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingSuccessfulPage())),
                  child: const Text("Proceed", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
             