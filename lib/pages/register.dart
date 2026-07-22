import 'package:flutter/material.dart';

// Reusable brand colors — kept consistent with the rest of the app
const kNavy = Color(0xFF10254A);   // accent color for buttons, icons
const kMuted = Color(0xFFB0B0B0);  // muted grey for secondary text

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // matches the black/navy theme across the app

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pushes everything below it down toward the bottom
              const Spacer(flex: 3),

              // Heading
              const Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),

              // Supporting subtext
              const Text(
                'Create an account or sign in to continue. Your stock, sales, and insights — always current, always accessible. Everything you need to run your business, in one place.',
                style: TextStyle(color: kMuted, fontSize: 13, height: 1.2),
              ),

              // Pushes the buttons down toward the bottom of the screen
              const Spacer(flex: 4),

              // Sign up — primary action, filled navy background
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kNavy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Navigates to the dedicated signup form page
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize:10, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Sign in — secondary action, outlined only
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigates to the dedicated login form page
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Small link — temporary shortcut to preview the inventory page
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/inventory');
                  },
                  child: const Text(
                    'Preview for free',
                    style: TextStyle(
                      color: kMuted,
                      fontSize: 11,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}