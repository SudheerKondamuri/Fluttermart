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

    Future.delayed(const Duration(milliseconds: 0), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const CustomNavigationBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
      ),
    );
  }
}
