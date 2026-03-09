import 'package:flutter/material.dart';

class ManageAddressPage extends StatelessWidget {
  const ManageAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text("Manage Address")),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddAddressMapPage())),
            icon: const Icon(Icons.add),
            label: const Text("Add another address"),
          ),
          ListTile(
            title: const Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Plot no. 209, Kavuri Hills, Homagama 80000\nPh: +91234567890"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [const PopupMenuItem(child: Text("Edit")), const PopupMenuItem(child: Text("Delete"))],
            ),
          ),
        ],
      ),
    );
  }
}

class AddAddressMapPage extends StatelessWidget {
  const AddAddressMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text("Manage Address")),
      body: Stack(
        children: [
          Container(color: Colors.grey[300], child: const Center(child: Text("Map View Placeholder"))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Pitipana, Homagama", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Text("Plot no. 209, Kavuri Hills, Homagama 80000", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),
                  const TextField(decoration: InputDecoration(labelText: "House/Flat Number", hintText: "Plot no. 209")),
                  const TextField(decoration: InputDecoration(labelText: "Landmark (Optional)")),
                  const SizedBox(height: 20),
                  const Text("Save as"),
                  Row(children: [ChoiceChip(label: const Text("Home"), selected: true), const SizedBox(width: 10), ChoiceChip(label: const Text("Other"), selected: false)]),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900], foregroundColor: Colors.white),
                      child: const Text("Proceed"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}