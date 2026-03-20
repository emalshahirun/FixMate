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


  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE8EAF6) : Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xFF1A237E) : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF1A237E) : Colors.black,
        ),
      ),
    );
  }



  void _showAddressModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              // Map Preview Placeholder
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage('assets/map_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.location_on, color: Color(0xFF1A237E), size: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}