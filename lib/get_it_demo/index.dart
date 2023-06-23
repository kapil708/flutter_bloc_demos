import 'package:flutter/material.dart';

import 'presentation/route/app_route.dart';

class GetItDemo extends StatelessWidget {
  GetItDemo({Key? key}) : super(key: key);

  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GetIt Demo",
      theme: ThemeData(primarySwatch: Colors.purple),
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }
}
