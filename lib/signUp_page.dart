import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget{
  const SignupPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(color: Color(0xFF5C6BC0),fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildTextField(hint: "Username"),
            const SizedBox(height: 20),
            _buildTextField(hint: "E-mail"),
            const SizedBox(height: 20),
            _buildTextField(hint: "Phone"),
            const SizedBox(height: 20),
            _buildTextField(hint: "Password", isPassword: true),
            const SizedBox(height: 20),
            _buildTextField(
                hint: "Confirm password",
                isPassword: true,
                showVisibilityIcon: true
            ),
            const SizedBox(height: 50),

            // Sign Up Button
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4355B8), // Matching the blue in image
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to keep code clean
  Widget _buildTextField({
    required String hint,
    bool isPassword = false,
    bool showVisibilityIcon = false
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: InputBorder.none,
          suffixIcon: showVisibilityIcon
              ? const Icon(Icons.visibility_off_outlined, color: Colors.grey)
              : null,
        ),
      ),
    );
  }
}
