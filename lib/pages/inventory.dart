// lib/pages/inventory.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Brand colors — BiasharaPulse Design System
const kOffWhiteCanvas = Color(0xFFFAFAFA);
const kCharcoalHeading = Color(0xFF121212);
const kBorderSubtle = Color(0xFFE4E4E7);
const kMutedText = Color(0xFF71717A);

// Gradient & Hero Colors
const kBlackBase = Color(0xFF0A0A0A);
const kBlackRich = Color(0xFF141414);
const kDarkRed = Color(0xFF700010);
const kDarkRedDeep = Color(0xFF4A000A);
const kCherryRed = Color(0xFFB0142B);
const kAmberGold = Color(0xFFD4A373);

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteCanvas,
      body: Stack(
        children: [
          // ── Header Container (Black fading into Dark Red at bottom) ──
          ClipPath(
            clipper: CurvedHeaderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.28,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kBlackBase,
                    kBlackRich,
                    kDarkRed,
                    kDarkRedDeep,
                  ],
                  stops: [0.0, 0.45, 0.85, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // ── Main Content Area ─────────────────────────────────────
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      // Brand Logo Text
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.orbitron(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ),
                          children: const [
                            TextSpan(
                              text: 'biashara',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'pulse',
                              style: TextStyle(color: kCherryRed),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 22,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          // TODO: Open drawer or options menu
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Header Title inside Curved Region
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inventory',
                        style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Track, search, and manage your products',
                        style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Main Inventory Content Placeholder
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: kDarkRed.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.inventory_2_outlined,
                              size: 36,
                              color: kDarkRed,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No items in inventory yet',
                            style: GoogleFonts.orbitron(
                              color: kCharcoalHeading,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add your products to start tracking stock, sales, and insights.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: kMutedText,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Custom Header Curve Clipper ──────────────────────────────────────────────
class CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 25,
      size.width,
      size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}