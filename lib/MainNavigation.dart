import 'package:flutter/material.dart';
import 'BookingScreen.dart';
import 'home_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const BookingsScreen(),
    const Center(child: Text("Profile Screen")),
    const Center(child: Text("Settings Screen")),
  ];

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