import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Next", style: TextStyle(color: Colors.indigo)),
                ),
              ),
            ),

            // Main Content (Image + Text)
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Circular Image Container
                        Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.indigo.withOpacity(0.05), width: 10),
                            image: const DecorationImage(
                              image: AssetImage("assets/onboard.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Title Text
                        const Text(
                          "We Provide Professional Home services at a very friendly price",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }

  // Helper widget for smooth dots
  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.indigo : Colors.indigo.withOpacity(0.2),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}