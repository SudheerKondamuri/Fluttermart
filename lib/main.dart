import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermart/pages/cart_provider.dart';
import 'package:fluttermart/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  PaintingBinding.instance.imageCache.maximumSizeBytes = 100 << 20;

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: kIsWeb ? DevicePreview(builder:(_)=> MyApp()) : const MyApp(),
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
