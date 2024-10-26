import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_model.dart';

class CounterViewModel extends StateNotifier<CounterModel> {
  CounterViewModel() : super(CounterModel(0));

  void increment() {
    state = CounterModel(state.value + 1);
  }

  void decrement() {
    state = CounterModel(state.value - 1);
  }
}
