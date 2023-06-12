import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/flutter_fly/blocs/app_blocs.dart';
import 'package:flutter_bloc_demos/flutter_fly/repo/repositories.dart';

import 'api_handling/index.dart';
import 'bloc_to_bloc/index.dart';
import 'boilerplate/index.dart';
import 'counter_demo/index.dart';
import 'flutter_fly/presentation/index.dart';
import 'infinite_list/app.dart';
import 'multi_screen_demo/index.dart';
import 'weather/index.dart';

enum Type { counter, multiScreen, blocToBloc, weatherApp, apiHandling, boilerPlate, flutterFly, infiniteList }

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  var defaultType = Type.infiniteList;

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
    case Type.boilerPlate:
      return runApp(const BoilerPlate());
    case Type.infiniteList:
      return runApp(const InfiniteList());
    case Type.flutterFly:
      return runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(UserRepository()),
            ),
          ],
          child: const FlutterFly(),
        ),
      );
  }
}
