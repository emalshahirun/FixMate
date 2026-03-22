import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: OnboardingScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual layout structure of the app.
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: SafeArea(
        // SafeArea ensures content doesn't overlap with status bar or notches.
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Consistent padding around content
          child: Column(
            // Column lays out its children vertically.
            children: [
              // 1. Top Bar (Status bar simulation and Skip button)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "9:41", // Status bar time
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row( // Status bar icons
                    children: [
                      const Icon(Icons.signal_cellular_4_bar, size: 14),
                      const SizedBox(width: 4),
                      const Icon(Icons.wifi, size: 14),
                      const SizedBox(width: 4),
                      const Icon(Icons.battery_full, size: 14),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10), // Small spacer
              Align(
                alignment: Alignment.centerRight,
                child: SkipButton(), // Skip button defined below
              ),

              const SizedBox(height: 50), // Spacer before the image

              // 2. Large Circular Image in the Center
              const CenterImageCircle(), // Image defined below

              const SizedBox(height: 40), // Spacer before the main text

              // 3. Description Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Easy Service booking & Scheduling",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24, // Matches the large text
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const Spacer(), // Pushes the following content to the bottom

              // 4. Page Indicator (e.g., • _ •)
              const PageIndicator(currentPage: 1, totalPages: 3), // Indicator defined below

              const SizedBox(height: 40), // Spacer before the button

              // 5. Centered Next/Continue Button
              const Center(
                child: NextButton(), // Button defined below
              ),

              const SizedBox(height: 20), // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for the 'Skip' button
class SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6), // Light grayish-purple background
        borderRadius: BorderRadius.circular(15), // Very rounded
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Text(
        "Skip",
        style: TextStyle(
          color: Color(0xFF3F51B5), // Darker indigo color for text
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Widget for the circular image with a fade effect at the bottom
class CenterImageCircle extends StatelessWidget {
  const CenterImageCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Basic Circular Image
          Container(
            width: 280, // Approximate size from the image
            height: 280,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/onboarding_hand.png'), // Add this to pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Fade Overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.0), // Top: transparent
                    Colors.white.withOpacity(1.0), // Bottom: fades to white background
                  ],
                  begin: const Alignment(0.0, 0.4), // Start fading below the midpoint
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for the page dots: light dot, dark dash, light dot
class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        // Dot vs. Dash logic
        final bool isCurrent = (index + 1) == currentPage;
        return Container(
          width: isCurrent ? 24 : 6, // Current page is a wider dash
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3), // Space between dots
          decoration: BoxDecoration(
            color: isCurrent ? const Color(0xFF303F9F) : const Color(0xFFE8EAF6), // Dark indigo for current, light gray for other
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}