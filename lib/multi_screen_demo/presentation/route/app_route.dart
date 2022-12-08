import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';
import '../screens/home.dart';
import '../screens/screen_2.dart';
import '../screens/screen_3.dart';

class AppRoute {
  final MultiCounterCubit _counterCubit = MultiCounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(value: _counterCubit, child: const HomeScreen()),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(value: _counterCubit, child: const SecondScreen()),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(value: _counterCubit, child: const ThirdScreen()),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
