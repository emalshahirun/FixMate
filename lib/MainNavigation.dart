import 'package:flutter/material.dart';
import 'BookingScreen.dart';
import 'Profile.dart';
import 'WorkerHome.dart';
import 'home_page.dart';

class MainNavigation extends StatefulWidget {

  final String userType;

  const MainNavigation({super.key, required this.userType});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    if (widget.userType == "Worker") {
      _screens = [
        const WorkerHomeScreen(),
        const Center(child: Text("Jobs")),
        const Center(child: Text("Profile")),
        const Center(child: Text("Settings")),
      ];
    } else {
      _screens = [
        const CustomerHomeScreen(),
        const BookingsScreen(),
        const ProfilePage(),
        const Center(child: Text("Settings")),
      ];
    }
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              label: 'Home'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Bookings'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings'
          ),

        ],
      ),
    );
  }
}