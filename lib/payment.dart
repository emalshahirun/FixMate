import 'package:fixmate/paymentSuccessPage.dart';
import 'package:fixmate/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentOptionPage extends StatefulWidget {
  const PaymentOptionPage({super.key});

  @override
  State<PaymentOptionPage> createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  String selectedMethod = "Visa";
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  bool _isProcessing = false;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && mounted) {
      dateController.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && mounted) {
      timeController.text = picked.format(context);
    }
  }

  void _confirmBooking() async {
    setState(() => _isProcessing = true);

    try {
      bool paymentSuccess = await PaymentService.processPayment(
        paymentMethodId: selectedMethod,
        amount: 1500.0,
        currency: 'LKR',
      );

      if (paymentSuccess) {
        final bookingData = {
          'date': dateController.text,
          'time': timeController.text,
          'method': selectedMethod,
          'amount': 1500,
          'status': 'Success',
          'timestamp': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance.collection('bookings').add(bookingData);

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment failed. Please try again.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Payment Option"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Payment Page Loaded", style: TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text("Current Location"),
                subtitle: const Text("2972 Westheimer Rd. Santa Ana, Illinois"),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              readOnly: true,
              onTap: pickDate,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                hintText: "Select Date",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              readOnly: true,
              onTap: pickTime,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.access_time),
                hintText: "Select Time",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Select Payment Method", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _paymentTile("Visa", "**** **** **** 8970", Icons.credit_card),
            _paymentTile("MasterCard", "**** **** **** 1234", Icons.credit_card),
            _paymentTile("PayPal", "user@mail.com", Icons.account_balance_wallet),
            _paymentTile("Cash", "Pay after service", Icons.money),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 13, 71, 161),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _isProcessing ? null : _confirmBooking,
                child: _isProcessing
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Confirm Booking", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile(String title, String subtitle, IconData icon) {
  bool isSelected = selectedMethod == title;

  return GestureDetector(
    onTap: () => setState(() => selectedMethod = title),
    child: Card(
      elevation: isSelected ? 5 : 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.blue),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            trailing: isSelected
                ? const Icon(Icons.keyboard_arrow_up)
                : const Icon(Icons.keyboard_arrow_down),
          ),

          /// 🔥 EXPANDED AREA
          if (isSelected)
            Padding(
              padding: const EdgeInsets.all(12),
              child: _paymentDetails(title),
            ),
        ],
      ),
    ),
  );
  }

  Widget _paymentDetails(String method) {
  if (method == "Visa" || method == "MasterCard") {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Card Number",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "Card Holder Name",
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  } else if (method == "PayPal") {
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter PayPal Email",
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  } else {
    return const Text(
      "Pay with cash after service",
      style: TextStyle(color: Colors.grey),
    );
  }
}
}