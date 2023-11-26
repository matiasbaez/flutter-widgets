
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/providers.dart';

// Extends from ConsumerWidget (Works as same as Stateless Widget, but with riverpod methods)
class CounterScreen extends ConsumerWidget {

 // Defining screen name as a constant
 static const String name = 'counter_screen';

 const CounterScreen({super.key});

 @override
 Widget build(BuildContext context, WidgetRef ref) {

    // Retrieving the counter value using Riverpod's read method
    final int counterClick = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
        actions: [
          IconButton(
            onPressed: () => ref.read(isDarkModeProvider.notifier).update((state) => !state),
            icon: Icon( isDarkMode ?  Icons.light_mode_outlined : Icons.dark_mode_outlined )
          ),
        ],
      ),

      body: Center(
        child: Text('Value: $counterClick', style: Theme.of(context).textTheme.titleLarge),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Updating the counter value using Riverpod's read method and the state incrementer
          // ref.read( counterProvider.notifier ).update((state) => state + 1);
          ref.read( counterProvider.notifier ).state++;
        },
      ),
    );
 }
}