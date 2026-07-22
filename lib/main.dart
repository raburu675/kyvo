// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/splash.dart'; // new splash screen
import 'pages/home.dart';
import 'pages/about.dart';
import 'pages/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/splash', // app now opens on the splash screen first
    routes: {
      '/splash': (context) => const Splash(), // splash — shows for 5 seconds
      '/': (context) => const Home(),          // your existing home page
      '/about': (context) => const About(),
      '/register': (context) => const Register(),
    },
  ));
}