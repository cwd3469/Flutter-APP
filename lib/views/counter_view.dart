// lib/views/counter_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class CounterView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Count: ${counterState.value}',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () =>
                      ref.read(counterProvider.notifier).decrement(),
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () =>
                      ref.read(counterProvider.notifier).increment(),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
