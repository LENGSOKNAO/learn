import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/controllers/counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  '${controller.count.value}',
                  style: Theme.of(context).textTheme.displayLarge,
                )),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  onPressed: () => controller.increment(),
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => controller.reset(),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
