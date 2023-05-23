import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<MultiCounterCubit, MultiCounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "Screen 2 add",
                  backgroundColor: Colors.red,
                  onPressed: () {
                    BlocProvider.of<MultiCounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 50),
                FloatingActionButton(
                  heroTag: "Screen 2 remove",
                  backgroundColor: Colors.red,
                  onPressed: () {
                    context.read<MultiCounterCubit>().increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pushNamed(context, '/third'),
              child: const Text("Screen 3"),
            ),
          ],
        ),
      ),
    );
  }
}
