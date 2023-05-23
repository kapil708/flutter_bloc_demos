import 'package:flutter/material.dart';

import 'bloc_to_bloc/index.dart';
import 'counter_demo/index.dart';
import 'multi_screen_demo/index.dart';
import 'weather/index.dart';

enum Type { counter, multiScreen, blocToBloc, weatherApp }

void main() {
  var defaultType = Type.weatherApp;

  switch (defaultType) {
    case Type.counter:
      // Counter Demo
      runApp(const MyCounterApp());
      break;
    case Type.multiScreen:
      // Multi Screen Demo
      runApp(const MyMultiScreenApp());
      break;
    case Type.blocToBloc:
      // Bloc to Bloc
      runApp(const BlocToBlocApp());
      break;
    case Type.weatherApp:
      // Bloc to Bloc
      runApp(const WeatherApp());
      break;
  }
}
