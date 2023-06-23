import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/screen2.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/second':
        return MaterialPageRoute(builder: (_) => const SecondScreen());
      default:
        return null;
    }
  }
}
