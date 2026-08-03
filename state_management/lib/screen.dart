import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:state_management/bloc/counter/counter_screen.dart';
import 'package:state_management/bloc/product/product_screen.dart';
import 'package:state_management/getx/bindings/counter_binding.dart';
import 'package:state_management/getx/bindings/product_binding.dart';
import 'package:state_management/getx/screens/counter_screen.dart';
import 'package:state_management/getx/screens/product_screen.dart';
import 'package:state_management/provider/providers/counter_provider.dart';
import 'package:state_management/provider/providers/product_provider.dart';
import 'package:state_management/provider/screens/counter_screen.dart';
import 'package:state_management/provider/screens/product_screen.dart';
import 'package:state_management/getx/data/api_client.dart';
import 'package:state_management/getx/data/product_repository.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(ProductRepository(ApiClient())),
        ),
      ],
      child: MaterialApp(
        title: 'State Management',
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State Management')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader('GetX'),
          _NavButton(
            label: 'GetX Counter',
            onTap: () => Get.to(
              () => const CounterScreen(),
              binding: CounterBinding(),
            ),
          ),
          _NavButton(
            label: 'GetX Products',
            onTap: () => Get.to(
              () => const ProductScreen(),
              binding: ProductBinding(),
            ),
          ),
          const Divider(height: 32),
          _SectionHeader('Provider'),
          _NavButton(
            label: 'Provider Counter',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProviderCounterScreen()),
            ),
          ),
          _NavButton(
            label: 'Provider Products',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProviderProductScreen()),
            ),
          ),
          const Divider(height: 32),
          _SectionHeader('BLoC'),
          _NavButton(
            label: 'BLoC Counter',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BlocCounterScreen()),
            ),
          ),
          _NavButton(
            label: 'BLoC Products',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const BlocProductScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onTap,
          child: Text(label),
        ),
      ),
    );
  }
}
