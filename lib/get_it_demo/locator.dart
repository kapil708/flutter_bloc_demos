import 'package:get_it/get_it.dart';

import 'logic/cubit/counter_cubit.dart';

final locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<CounterCubit>(() => CounterCubit());
}
