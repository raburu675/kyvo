// lib/pages/splash.dart
import 'dart:async'; // needed for the Timer that counts down the 5 seconds
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

// StatefulWidget because we need to run a timer when this screen loads
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Starts a 5 second timer as soon as this screen appears
    Timer(const Duration(seconds: 5), () {
      // pushReplacement swaps this screen out completely —
      // so the user can't press "back" and return to the splash screen
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green, // solid green background, as requested
      body: const Center(
        // Centers the heading both horizontally and vertically
        child: Text(
          'STOCKPULSE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}