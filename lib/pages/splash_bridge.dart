import 'package:flutter/material.dart';
import 'package:fluttermart/navigationbar.dart';

class SplashBridge extends StatefulWidget {
  const SplashBridge({Key? key}) : super(key: key);

  @override
  State<SplashBridge> createState() => _SplashBridgeState();
}

class _SplashBridgeState extends State<SplashBridge> {
  @override
  void initState() {
    super.initState();

    // Delay to allow Flutter to build the widget tree and avoid jank
    Future.delayed(const Duration(milliseconds: 0), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const CustomNavigationBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // match splash background
      body: const Center(
        // child: CircularProgressIndicator(
        //   color: Color.fromARGB(255, 255, 255, 255), // or any color you want
        // ),
      ),
    );
  }
}
