import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter/counter_bloc.dart';
import 'package:state_management/bloc/counter/counter_event.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${state.count}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  onPressed: () => context.read<CounterBloc>().add(CounterIncrement()),
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () => context.read<CounterBloc>().add(CounterReset()),
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
