import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../locator.dart';
import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = locator.get<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocProvider<CounterCubit>(
              create: (context) => counterCubit,
              child: BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text("Second Screen $state");
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => counterCubit.decrement(),
              child: const Text("Decrement"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
