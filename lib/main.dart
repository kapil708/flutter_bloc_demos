import 'package:flutter/material.dart';

import 'api_handling/index.dart';
import 'bloc_to_bloc/index.dart';
import 'counter_demo/index.dart';
import 'multi_screen_demo/index.dart';
import 'weather/index.dart';

enum Type { counter, multiScreen, blocToBloc, weatherApp, apiHandling }

void main() {
  var defaultType = Type.apiHandling;

  switch (defaultType) {
    case Type.counter:
      return runApp(const MyCounterApp());
    case Type.multiScreen:
      return runApp(const MyMultiScreenApp());
    case Type.blocToBloc:
      return runApp(const BlocToBlocApp());
    case Type.weatherApp:
      return runApp(const WeatherApp());
    case Type.apiHandling:
      return runApp(const ApiHandling());
  }
}
