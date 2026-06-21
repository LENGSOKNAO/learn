import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        // height: size.height,
        child: Image.asset(
          "assets/jon-flobrant-VjdII_v1_6w-unsplash 1.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
