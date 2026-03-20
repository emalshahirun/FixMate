import 'package:flutter/material.dart';

class ManageAddressPage extends StatelessWidget {
  const ManageAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Manage Address", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 20),
              label: const Text("Add another address", style: TextStyle(fontSize: 16)),
            ),
            //

            const SizedBox(height: 20),
            _buildAddressCard(
              context,
              title: "Home",
              address: "Plot no.209, Kavuri Hills, Madhapur, 500033\nPh: +91234567890",
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildAddressCard(BuildContext context, {required String title, required String address}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(address, style: const TextStyle(color: Colors.grey, height: 1.5)),
              ],
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }

}