import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_demos/multi_screen_demo/logic/cubit/counter_cubit.dart';

import 'presentation/route/app_route.dart';

class BlocToBlocApp extends StatefulWidget {
  const BlocToBlocApp({super.key});

  @override
  State<BlocToBlocApp> createState() => _BlocToBlocAppState();
}

class _BlocToBlocAppState extends State<BlocToBlocApp> {
  final AppRoute _appRoute = AppRoute();
  final Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context))),
      ],
      child: MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}
