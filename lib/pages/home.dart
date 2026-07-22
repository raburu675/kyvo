import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      fit: StackFit.expand,
      children: [
        // Loads an image directly from a URL instead of a local file
        Image.asset(
          'assets/images/home_bg.jpeg',
          fit: BoxFit.cover, // scales and crops the image to fill the space without distorting it
        ),

        //Dark overlay so text stays readable
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.85),
                ],
              ),
            ),
        ),

        //content
        // SafeArea keeps content clear of notches, status bars, and system UI intrusions
        SafeArea(
          child: Padding(
            // Horizontal breathing room so text/buttons don't touch screen edges
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              // Pushes all children to the bottom of the available space
              mainAxisAlignment: MainAxisAlignment.end,
              // Left-aligns children (Column's cross axis is horizontal)
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main heading text
                const Text(
                  'Managing your business\njust got easier',
                  style: TextStyle(
                    color: Colors.white,        // white text over the dark image overlay
                    fontSize: 26,                // large, heading-sized
                    fontWeight: FontWeight.w800, // bold weight
                    height: 1.2,                 // line spacing between the two lines
                  ),
                ),

                // Vertical gap between heading and paragraph
                const SizedBox(height: 12),

                // Supporting paragraph below the heading
                const Text(
                  "From stock counts to sales, everything about your business lives in one place. Know what's moving, what's running low, and what needs your attention — before it becomes a problem",
                  style: TextStyle(
                    color: Color(0xFFB0B0B0), // muted grey so it doesn't compete with the heading
                    fontSize: 12,
                    height: 1.2, // more relaxed line spacing for readability
                  ),
                ),

                // Larger gap before the button
                const SizedBox(height: 32),

                // SizedBox forces the button to stretch full width
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // Custom styling for the button itself
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,  // white background, as requested
                      foregroundColor: Colors.black,  // black text/icon color
                      padding: const EdgeInsets.symmetric(vertical: 16), // tall tap target
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // rounded corners
                      ),
                      elevation: 0, // flat, no drop shadow
                    ),
                    // What happens when the button is tapped — this is the page-to-page navigation
                    onPressed: () {
                      Navigator.pushNamed(context, '/about'); // navigate to the about page route
                    },
                    // Row lets us place an icon and text side by side inside the button
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // keeps icon + text centered as a pair
                      children: const [
                        Icon(Icons.arrow_forward, size: 14), // arrow icon, sits to the left of the text
                        SizedBox(width: 8), // small horizontal gap between icon and text
                        Text(
                          'Get Started',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom padding so the button isn't flush against the screen edge
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ]
     ),
    );
  }
}