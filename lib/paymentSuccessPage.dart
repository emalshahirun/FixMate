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
 