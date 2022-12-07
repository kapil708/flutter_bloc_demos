import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/counter_demo/counter.dart';
import 'package:flutter_bloc_demos/counter_demo/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Demo")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("Counter Demo"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<CounterCubit>(
                      create: (context) => CounterCubit(),
                      child: const Counter(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
