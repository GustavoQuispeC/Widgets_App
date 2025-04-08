import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider); //! Lee el valor
    final bool isDarkMode = ref.watch(isDarkModeProvider); //! Lee el valor

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Valor $count',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(counterProvider.notifier)
              .state++; // Navigator.pushNamed(context, CounterScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
