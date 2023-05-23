import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/multi_screen_demo/logic/cubit/counter_cubit.dart';

import 'presentation/route/app_route.dart';

class MyMultiScreenApp extends StatefulWidget {
  const MyMultiScreenApp({super.key});

  @override
  State<MyMultiScreenApp> createState() => _MyMultiScreenAppState();
}

class _MyMultiScreenAppState extends State<MyMultiScreenApp> {
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MultiCounterCubit>(
      create: (context) => MultiCounterCubit(),
      child: MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(primarySwatch: Colors.red),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }

  @override
  void dispose() {
    _appRoute.dispose();
    super.dispose();
  }
}
