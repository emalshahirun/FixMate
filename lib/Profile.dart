import 'package:flutter/material.dart';
import 'Profile2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Image.asset('assets/logo.png', height: 40),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.storefront_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(radius: 40),
            title: const Text("John Kevin", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            subtitle: const Text("+91 1234567890"),
            trailing: IconButton(
              icon: const Icon(Icons.edit_square, color: Colors.blue),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage())),
            ),
          ),
          const Divider(height: 40),
          _menuItem(context, Icons.location_on_outlined, "Manage Address", const ManageAddressPage()),
          _menuItem(context, Icons.share_outlined, "Refer & Earn", null),
          _menuItem(context, Icons.star_outline, "Rate us", null),
          _menuItem(context, Icons.info_outline, "About FixMate", null),
          _menuItem(context, Icons.logout, "Logout", null),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? target) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () { if (target != null) Navigator.push(context, MaterialPageRoute(builder: (context) => target)); },
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text("Edit Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.camera_alt)),
            const SizedBox(height: 30),
            const TextField(decoration: InputDecoration(labelText: "Full Name", hintText: "John Kevin")),
            const TextField(decoration: InputDecoration(labelText: "Email", hintText: "johnkevin787@gmail.com")),
            const TextField(decoration: InputDecoration(labelText: "Mobile Number", hintText: "+91 1234567890")),
            const Spacer(),
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
    );
  }
}