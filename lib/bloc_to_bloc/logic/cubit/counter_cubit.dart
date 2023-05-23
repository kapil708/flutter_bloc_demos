import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {
  int counterValue;
  bool? wasIncremented;

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}

class CounterCubit extends Cubit<CounterState> {
  /*final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;*/

  /*CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }*/

  CounterCubit() : super(CounterState(counterValue: 0));

  /*StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen((result) {
      if (result is InternetConnected && result.connectionType == ConnectionType.wifi) {
        increment();
      }
      if (result is InternetConnected && result.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }*/

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false));

  /*@override
  Future<void> close() {
    internetStreamSubscription!.cancel();
    return super.close();
  }*/
}
