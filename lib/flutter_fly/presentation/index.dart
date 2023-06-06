import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './login/login_view.dart';
import 'home_screen.dart';

const detailScreen = 'detail';
const LoginScreen = 'login';
const homeScreen = '/';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: LoginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return LoginForm();
          },
        ),
        GoRoute(
          path: detailScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);

class FlutterFly extends StatelessWidget {
  const FlutterFly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Flutter fly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
