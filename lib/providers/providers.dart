import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/counter_viewmodel.dart';
import '../models/counter_model.dart';

// Counter 상태를 제공하는 Provider 정의
final counterProvider = StateNotifierProvider<CounterViewModel, CounterModel>(
    (ref) => CounterViewModel());
