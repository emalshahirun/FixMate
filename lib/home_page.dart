import 'package:flutter/material.dart';
import 'WorkerListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF5E7), // Light cream background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Image.asset('assets/logo.png', height: 40), // Replace with your FixMate logo
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.storefront_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                fillColor: const Color(0xFFE0E0E0),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Categories Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75, // Adjust this to fit text and image perfectly
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(context, categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryModel category) {
    return GestureDetector(
      onTap: () {
        // Navigate to the Worker List Screen when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkerListScreen(categoryTitle: category.title),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            category.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

// Data Model
class CategoryModel {
  final String title;
  final String image;
  CategoryModel(this.title, this.image);
}

// Dummy Data
final List<CategoryModel> categories = [
  CategoryModel("CARPENTERS", "assets/carpenter.png"),
  CategoryModel("PAINTERS", "assets/painter.png"),
  CategoryModel("MASONS", "assets/mason.png"),
  CategoryModel("PLUMBERS", "assets/plumber.png"),
  CategoryModel("VEHICLE REPAIRS", "assets/vehicle.png"),
  CategoryModel("WELDING", "assets/welding.png"),
  CategoryModel("A/C REPAIR", "assets/ac.png"),
  CategoryModel("ELECTRICIAN", "assets/electrician.png"),
  CategoryModel("LANDSCAPING", "assets/landscaping.png"),
];