import 'ManageAddressPage.dart';
import 'package:flutter/material.dart';
import 'user_selection.dart';

import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Kevin";
  String phone = "+91 1234567890";
  ImageProvider<Object>? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "FixMate",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.storefront_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "My Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text("Welcome back!", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Profile info
          ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              backgroundImage: profileImage,
              child: profileImage == null
                  ? const Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                  : null,
            ),
            title: Text(
              name,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(phone),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () async {
                // Here you can integrate edit profile later
              },
            ),
          ),

          const Divider(height: 40),

          // Menu items
          _menuItem(
            context,
            Icons.location_on_outlined,
            "Manage Address",
            const ManageAddressPage(),
          ),
          _menuItem(
            context,
            Icons.card_giftcard,
            "Refer & Earn",
            const ReferEarnPage(),
          ),
          _menuItem(
            context,
            Icons.star_outline,
            "Rate Us",
            const RateUsPage(),
          ),
          _menuItem(
            context,
            Icons.info_outline,
            "About Us",
            const AboutUsPage(),
          ),
          _menuItem(context, Icons.logout, "Logout", null, isLogout: true),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, IconData icon, String title, Widget? page,
      {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : Colors.black87),
      title: Text(
        title,
        style: TextStyle(color: isLogout ? Colors.red : Colors.black87),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        if (isLogout) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const UserSelectionScreen(userType: '')),
            (route) => false,
          );
        } else if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
      },
    );
  }
}

// ================= MANAGE ADDRESS PAGE ===================
class ManageAddressPage extends StatefulWidget {
  const ManageAddressPage({super.key});

  @override
  State<ManageAddressPage> createState() => _ManageAddressPageState();
}

class _ManageAddressPageState extends State<ManageAddressPage> {
  final TextEditingController addressController = TextEditingController();
  String savedAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Address")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Enter Address",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  savedAddress = addressController.text.trim();
                });
                FocusScope.of(context).unfocus();
              },
              child: const Text("Done"),
            ),
            const SizedBox(height: 20),
            if (savedAddress.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue[50],
                ),
                child: Text(
                  savedAddress,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ================= REFER & EARN PAGE ===================
class ReferEarnPage extends StatelessWidget {
  const ReferEarnPage({super.key});

  final String referralCode = "FIXMATE123"; // example code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Refer & Earn")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Share your referral code and earn rewards!",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              SelectableText(
                referralCode,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  // You can add sharing logic here
                },
                child: const Text("Share"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= RATE US PAGE ===================
class RateUsPage extends StatefulWidget {
  const RateUsPage({super.key});

  @override
  State<RateUsPage> createState() => _RateUsPageState();
}

class _RateUsPageState extends State<RateUsPage> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate Us")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.orange, Colors.red]),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "How was your experience?",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      Icons.star,
                      color: index < rating ? Colors.yellow : Colors.white70,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {
                        rating = index + 1;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: rating == 0 ? null : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Thanks for rating $rating stars!")),
                  );
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 15),
              Text(
                "Rating: $rating Stars",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ABOUT US PAGE ===================
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final TextEditingController aboutController = TextEditingController();
  String savedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Us")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: aboutController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Write something about us...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  savedText = aboutController.text.trim();
                });
                FocusScope.of(context).unfocus();
              },
              child: const Text("Done"),
            ),
            const SizedBox(height: 20),
            if (savedText.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue[50],
                ),
                child: Text(
                  savedText,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Dummy user selection screen to avoid error on logout
class UserSelectionScreen extends StatelessWidget {
  final String userType;
  const UserSelectionScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('User Selection Screen (userType: $userType)')),
    );
  }
}