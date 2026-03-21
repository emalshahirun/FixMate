import 'package:fixmate/paymentSuccess2.dart';
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

  // Date Picker
  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dateController.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  // Time Picker
  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

  void _confirmBooking() async {
    final bookingData = {
      'date': dateController.text,
      'time': timeController.text,
      'method': selectedMethod,
      'amount': 1500,
      'status': 'Success',
      'timestamp': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance.collection('bookings').add(bookingData);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
    );
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
            // Location Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blue),
                title: const Text("Current Location"),
                subtitle: const Text("2972 Westheimer Rd. Santa Ana, Illinois"),
              ),
            ),

            const SizedBox(height: 20),

            // Date Field
            TextField(
              controller: dateController,
              readOnly: true,
              onTap: pickDate,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.calendar_today),
                hintText: "Select Date",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                hintText: "Time",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select payment method",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _paymentTile("Visa", "**** **** **** 8970", Icons.credit_card),
            _paymentTile("MasterCard", "**** **** **** 8970", Icons.payment),
            _paymentTile(
              "Paypal",
              "mailaddress@mail.com",
              Icons.account_balance_wallet,
            ),
            _paymentTile("Cash", "Expires: 12/26", Icons.money),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
                onPressed: _confirmBooking,
                child: const Text(
                  "Confirm Booking",
                  style: TextStyle(color: Colors.white),
                ),
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
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
