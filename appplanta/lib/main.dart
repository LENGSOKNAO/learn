import 'package:appplanta/core/routes/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Planta());
}

class Planta extends StatelessWidget {
  const Planta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
