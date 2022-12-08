import 'package:flutter_bloc/flutter_bloc.dart';

class MultiCounterState {
  int counterValue;
  bool? wasIncremented;

  MultiCounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}

class MultiCounterCubit extends Cubit<MultiCounterState> {
  MultiCounterCubit() : super(MultiCounterState(counterValue: 0));

  void increment() => emit(MultiCounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(MultiCounterState(counterValue: state.counterValue - 1, wasIncremented: false));
}
