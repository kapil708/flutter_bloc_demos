import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demos/counter_demo/counter.dart';
import 'package:flutter_bloc_demos/counter_demo/counter_cubit.dart';

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
