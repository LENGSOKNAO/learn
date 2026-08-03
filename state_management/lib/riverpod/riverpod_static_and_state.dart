import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// provider are function which will return a cached  value when called with same parameter
// static provider is use it with no state can't update provider
final counterProvder = Provider((res) => {0});
// state provider
final stateProvider = StateProvider((res) => 0);
// use consumer for don't build don't rebuild
class RiverpodStaticAndState extends ConsumerWidget {
  const RiverpodStaticAndState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Number for Count")),
      body: Column(
        children: [
          Text('$count'),
          TextButton(
            onPressed: () {
              ref.read(stateProvider.notifier).state++;
            },
            child: Text("Count"),
          ),
        ],
      ),
    );
  }
}
