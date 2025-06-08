import 'package:flutter/material.dart';
import 'package:fluttermart/pages/cart_provider.dart';
import 'package:fluttermart/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20;
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        splashColor: const Color(0xFF424242).withOpacity(0.5),
        highlightColor: Colors.red.withOpacity(0),
      ),
      home: SplashScreen(),
    );
  }
}
