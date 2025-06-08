import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_bridge.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.gif', height: 120),
          const SizedBox(height: 16),
          Text(
            'FlutterMart',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      splashIconSize: 250,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: SplashBridge(),
    );
  }
}
