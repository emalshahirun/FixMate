import 'package:fixmate/settings2,3.dart';
import 'package:fixmate/settings4,5,6,7.dart';
import 'package:fixmate/user_selection.dart';
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
        title: const Text("FixMate", style: TextStyle(color: Colors.black)), // Replaced Image.asset with Text for demo safety
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
            leading: const CircleAvatar(radius: 40, backgroundColor: Colors.grey),
            title: const Text("John Kevin", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            subtitle: const Text("+91 1234567890"),
            trailing: IconButton(
              icon: const Icon(Icons.edit_square, color: Colors.blue),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage())),
            ),
          ),
          const Divider(height: 40),

          // Updated Menu Items with Navigation
          _menuItem(context, Icons.location_on_outlined, "Manage Address", const ManageAddressPage()),
          _menuItem(context, Icons.share_outlined, "Refer & Earn", const AddCreditCardPage()),
          _menuItem(context, Icons.star_outline, "Rate us", const ContactUsPage()),
          _menuItem(context, Icons.info_outline, "About FixMate", const PrivacyPolicyPage()),

          // Logout usually triggers a dialog or a clear-session function rather than just a page
          _menuItem(context, Icons.logout, "Logout", null, isLogout: true),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? target, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.black87),
      title: Text(title, style: TextStyle(color: isLogout ? Colors.red : Colors.black87)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (isLogout) {
          _handleLogout(context);
        } else if (target != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => target));
        }
      },
    );
  }
  void _handleLogout(BuildContext context) {
    // pushAndRemoveUntil ensures the user cannot go "back" to the profile
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const UserSelectionScreen(userType: '',)),
          (route) => false,
    );
  }
}

// --- Destination Pages ---

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
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