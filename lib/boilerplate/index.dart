import 'package:flutter/material.dart';

import 'core/theme/color_schemes.g.dart';

class BoilerPlate extends StatelessWidget {
  const BoilerPlate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BoilerPlate",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
    );
  }
}
